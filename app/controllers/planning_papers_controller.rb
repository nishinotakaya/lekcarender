class PlanningPapersController < ApplicationController
  def new
    @blog = Blog.find(params[:id])
    @plan = PlanningPaper.new
  end

  def show
    @plan = PlanningPaper.find(params[:id])
  end

  def create
    @plan = PlanningPaper.create(planinng_parameter)
      flash[:success] = "企画書を作成しました！"
      redirect_to blogs_path
  end

  def destroy
    @plan = Planningpapers.find(params[:id])
    @plan.delete
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @plan = Planningpaper.find(params[:id])
  end

  def update
    @plan = Planningpaper.find(params[:id])
    if @plan.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def planinng_parameter
    params.require(:planning_paper).permit(:plannning_name, :planning_severe, :plannning_point, :plannning_place, :plannning_people_count, :plannning_preparation_object, :planning_person, :plannning_time,:planning_note, :planning_palace_picture)
  end

end
