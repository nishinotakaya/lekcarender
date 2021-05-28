class PlanningPapersController < ApplicationController
  def new
    @blog = Blog.find(params[:id])
    @plan = PlanningPaper.new
  end

  def show
    @plan = PlanningPaper.find(params[:id])
  end

  def create
    ActiveRecord::Base.transaction do
      planinng_parameter.each do |id, item|
        plan =  PlanningPaper.find(id)
        plan.create(item)
      end  
      flash[:success] = "企画書を作成しました！"
      redirect_to blogs_path
    end 
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
    params.permit(:plannning_time, :plannning_point, :plannning_day_2, :plannning_day_3, :plannning_place, :plannning_people_count, :plannning_preparation_object)
  end

end
