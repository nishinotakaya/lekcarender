class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /clients or /clients.json
  def index
    @search_params = client_search_params
    @clients = current_user.clients.where(user_id: current_user.id).search(@search_params).order(:name_h)
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
