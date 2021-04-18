class Client < ApplicationRecord


  validates :name, presence: true
  validates :birthday, presence: true
  validates :use_day, presence: true


  before_save do
    self.use_day.gsub!(/[\[\]\"]/, "") if attribute_present?("use_day")
  end

  # scope :search, -> (search_params) do
  #   return if search_params.blank?

  #     name_like(search_params[:name])
  #     .birthday_like(search_params["birthday(2i)"].to_i)
  #     .use_like(search_params[:use_day])
  # end
  # scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  # scope :birthday_like, -> (birthday) { where('birthday LIKE ?',  "%#{params[:birthday]}%") if birthday.present?  }
  # debugger
  # scope :use_like, -> (use_day) { where('use_day LIKE ?', "%#{use_day}%") if use_day.present? }
 

end
