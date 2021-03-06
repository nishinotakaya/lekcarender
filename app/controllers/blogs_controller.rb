class BlogsController < ApplicationController
  def index
    @first_day = params[:date].nil? ? 
    Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    @blogs = Blog.where(start_time: @first_day..@last_day).group(:start_time)
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    Blog.create(blog_parameter)
    redirect_to blogs_path
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def all_blogs_edit
    @first_day = params[:date].nil? ? 
    Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    one_month = [*@first_day..@last_day]
     @blogs = Blog.where(start_time: @first_day..@last_day).group(:start_time)
     unless one_month.count == @blogs.count
       ActiveRecord::Base.transaction do 
         one_month.each { |day| @blogs.create!(start_time: day) }
       end
       @blogs = Blog.where(start_time: @first_day..@last_day).order(:start_time).group(:start_time)
     end
   end  
 
   def all_blogs_update
     ActiveRecord::Base.transaction do # トランザクションを開始します。
       all_blogs_parameter.each do |id, item|
         blog = Blog.find(id)
         blog.update_attributes!(item)  
       end
     end
     flash[:success] = "レクカレンダーを更新しました"
     redirect_to blogs_url      
   end  
 
   private
 
   def blog_parameter
     params.require(:blog).permit(:title, :content, :start_time)
   end
 
   def all_blogs_parameter
     params.require(:blog).permit(blogs: [:title, :content, :start_time])[:blogs]
   end
 
end
