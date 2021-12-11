class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_select, only: %i[ edit index new ]
  before_action :authenticate_user!
  require 'csv'
  # GET /tasks or /tasks.json
  def index
    @search_task_params = task_search_params
    @tasks = Task.where(user_id: current_user.id).page(params[:page]).per(10).search_task(@search_task_params).order(:classification)
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_data @tasks.export , filename: "task.csv"
      end
    end  
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def soko_create
    @soko_total = Task.where(user_id: 100).order(:total)
  end
  
  def soko_create_submit
    @soko_total = Task.where(user_id: 100)
    @soko_total.create(task_total_params)
    redirect_to tasks_url
  end  

  def soko_delete_submit
    @soko_total = Task.find(params[:id])
    @soko_total.destroy
    redirect_to soko_create_tasks_url
  end  

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def classification_create
    @soko_total = Task.where(user_id: 200).order(:total)
  end

  def classification_create_submit
    @soko_total = Task.where(user_id: 200)
    @soko_total.create(task_classification_params)
    redirect_to request.referer
  end  

  def classification_delete_submit
    @soko_total = Task.find(params[:id])
    @soko_total.destroy
    redirect_to  request.referer
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_select
      @tasks_select_total = Task.where(user_id: 100).order(:total)
      @tasks_select_classifcation = Task.where(user_id: 200).order(:classification)
    end  

    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:classification, :total, :manager, :inc, :title, :contents, :copywarehouse, :warehousecode, :firstshipping, :firststock, :finishwarehouse, :integrationinstance, :hubinstance, :user_id).merge(user_id: current_user.id)
    end

    def task_total_params
      params.require(:task).permit(:total).merge(user_id: 100)
    end

    def task_classification_params
      params.require(:task).permit(:classification).merge(user_id: 200)
    end

    def task_search_params
      params.fetch(:search_task, {}).permit(:inc, :title, :total, :classification).merge(user_id: params[:user_id])
    end
end
