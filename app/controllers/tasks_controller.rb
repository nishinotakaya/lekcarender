class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_select, only: %i[ edit index new ]
  before_action :authenticate_user!
  require 'csv'
  # GET /tasks or /tasks.json
  def index
    @search_task_params = task_search_params
    @tasks = Task.where(user_id: current_user.id).search_task(@search_task_params)
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_tasks_csv(@tasks)
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

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_select
      @tasks_select_total = Task.where(user_id: 100)
      @tasks_select_classifcation = Task.where(user_id: 200)
    end  

    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:classification, :total, :manager, :inc, :title, :contents, :copywarehouse, :firstshipping, :firststock, :finishwarehouse, :integrationinstance, :hubinstance, :user_id).merge(user_id: current_user.id)
    end


    def send_tasks_csv(tasks)
      csv_data = CSV.generate(row_sep: "\r\n", encoding:Encoding::CP932, force_quotes: true)  do |csv|
        header = %w(分類 会計 担当者 インシデント 件名 内容 コピー元倉庫 初回出荷 初回入荷 初回終了 統合インスタンス 拠点インスタンス)
        csv << header
        tasks.each do |task|
          values = [
            task.classification,
            task.total,
            task.manager,
            task.inc,
            task.title,
            task.contents,
            task.copywarehouse,
            task.firstshipping,
            task.firststock,
            task.finishwarehouse,
            task.integrationinstance,
            task.hubinstance
          ]
          csv << values
        end
      end
      send_data(csv_data, filename: "tasks.csv")
    end

    def task_search_params
      params.fetch(:search_task, {}).permit(:inc, :title, :total, :classification).merge(user_id: params[:user_id])
    end
end
