class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  require 'csv'
  # GET /clients or /clients.json
  def index
    @search_params = client_search_params
    @clients = current_user.clients.where(user_id: current_user.id).search(@search_params).order(:name_h)
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_clients_csv(@clients)
      end
    end  
  end

  # def text_index
  #   @clients = Client.all
  # end  

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = current_user.clients.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = current_user.clients.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    @client = Client.find(params[:id])
      if @client.update(client_params)
        redirect_to clients_path, notice: "編集しました"
      else
        render 'edit'
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    def send_clients_csv(clients)
      csv_data = CSV.generate(row_sep: "\r\n", encoding:Encoding::CP932)  do |csv|
        header = %w(名前 性別 誕生日(和暦) 誕生日(月日) 年齢 利用日)
        csv << header
        clients.each do |client|
          values = [
            client.name,
            client.sex,
            japanesese_calendar(client.birthday),
            client.birthday.strftime("%m月 %d日"),
            age(client.birthday),
            client.use_day
          ]
          csv << values
        end
      end
      send_data(csv_data, filename: "clients.csv")
    end

    def japanesese_calendar(birthday)
      case birthday.year
        when 0..1911
          "明治#{birthday.year - 1867}年"
        when 1912
          "明治45/大正元年"
        when 1913..1925
          "大正#{birthday.year - 1911}年"
        when 1926                                                                   
          "大正15/昭和元年"
        when 1927..1988
          "昭和#{birthday.year - 1925}年"
        when 1989
          "昭和64/平成元年"
        else
          "平成#{birthday.year - 1988}年"
      end 
    end

    def age(birthday)
      (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = current_user.clients.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :name_h, :birthday, :sex, use_day: [])
    end

    def client_search_params
      params.fetch(:search, {}).permit(:name, :birthday, :use_day).merge(user_id: params[:user_id])
    end
end
