class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.where(user_id: current_user.id)
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
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:classification, :total, :manager, :inc, :title, :st, :edi, :firstshipping, :firststock, :finishwarehouse, :integrationinstance, :hubinstance, :user_id).merge(user_id: current_user.id)
    end


    def send_tasks_csv(tasks)
      csv_data = CSV.generate(row_sep: "\r\n", encoding:Encoding::CP932)  do |csv|
        header = %w(分類 会計 担当者 インシデント 件名 ステータス EDI 初回出荷 初回入荷 初回終了 統合インスタンス 拠点インスタンス)
        csv << header
        tasks.each do |task|
          values = [
            task.classification,
            task.total,
            task.manager,
            task.inc,
            task.title,
            task.st,
            task.edi,
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
end
