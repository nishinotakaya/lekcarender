class LekUrlsController < ApplicationController
  before_action :set_lek_url, only: %i[ show edit update destroy ]
  # GET /lek_urls or /lek_urls.json
  def index
    @lek_urls = LekUrl.all
  end

  # GET /lek_urls/1 or /lek_urls/1.json
  def show
  
  end

  # GET /lek_urls/new
  def new
    @lek_url = LekUrl.new
  end

  # GET /lek_urls/1/edit
  def edit
  end

  # POST /lek_urls or /lek_urls.json
  def create
    @lek_url = LekUrl.new(lek_url_params)
    respond_to do |format|
      if @lek_url.save
        format.html { redirect_to @lek_url, notice: "レクを追加しました" }
        format.json { render :show, status: :created, location: @lek_url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lek_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lek_urls/1 or /lek_urls/1.json
  def update
    respond_to do |format|
      if @lek_url.update(lek_url_params)
        format.html { redirect_to @lek_url, notice: "レクを更新しました" }
        format.json { render :show, status: :ok, location: @lek_url }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lek_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lek_urls/1 or /lek_urls/1.json
  def destroy
    @lek_url.destroy
    respond_to do |format|
      format.html { redirect_to lek_urls_url, notice: "レクを削除しました" }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lek_url
    @lek_url = LekUrl.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lek_url_params
    params.require(:lek_url).permit(:name, :url)
  end

  def search_params
    params.require(:q).permit(:name)
  end
  
end
