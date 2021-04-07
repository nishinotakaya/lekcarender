class BlogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find_by(id: params[:user_id])
    @first_day =  params[:date].nil? ? 
		Date.current.beginning_of_month : params[:date].to_date
		@last_day = @first_day.end_of_month
    one_month = [*@first_day..@last_day]
      @blogs = current_user.blogs.where(start_time: @first_day..@last_day).order(:start_time)
      unless one_month.count == @blogs.count
          ActiveRecord::Base.transaction do 
            one_month.each { |day| @blogs.create!(start_time: day) }
          end
        end
    start_date = params.fetch(:start_date, Date.today).to_date
    @blog = Blog.find_by(id: params[:id])
    @blogs =  current_user.blogs.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week) 
  end

  def carendar_top
    @blog = Blog.where(id: 1)
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
    @user = User.find_by(id: params[:user_id])
    @blog = Blog.find_by(id: params[:id])
    @first_day =  params[:date].nil? ? 
		Date.current.beginning_of_month : params[:date].to_date
		@last_day = @first_day.end_of_month
    one_month = [*@first_day..@last_day]
      @blogs = current_user.blogs.where(start_time: @first_day..@last_day).order(:start_time)
      unless one_month.count == @blogs.count
          ActiveRecord::Base.transaction do 
            one_month.each { |day| @blogs.create!(start_time: day) }
          end
        end
      @blogs = current_user.blogs.where(start_time: @first_day..@last_day).select("blogs.id", "start_time", "title", "content").group(:start_time)
   end  
 
   def all_blogs_update
     ActiveRecord::Base.transaction do # トランザクションを開始します。
        @blog = Blog.where(id: 1)
        @blog.update(not_content_birthday_people)
       all_blogs_parameter.each do |id, item|
         blog = Blog.find(id)
         blog.update_attributes!(item)
       end
     end
     flash[:success] = "レクカレンダーを更新しました"
     redirect_to blogs_url
   end  

   def blogs_birthday
   end

 
   private
 
   def blog_parameter
     params.require(:blog).permit(:title, :content, :start_time, :not_content_birthday_people)
   end

  def not_content_birthday_people
    params.require(:blog).permit(:not_content_birthday_people)
  end
 
   def all_blogs_parameter
     params.require(:blog).permit(blogs: [:title, :content, :start_time, :not_content_birthday_people])[:blogs]
   end

   def current_blog
    @current_blog ||= Blog.find_by(id: session[:id])
  end

  def start_time
    self.my_related_model.start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
 
end
