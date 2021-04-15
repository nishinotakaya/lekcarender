class Client < ApplicationRecord


  validates :name, presence: true

  before_save do
    self.use_day.gsub!(/[\[\]\"]/, "") if attribute_present?("use_day")
  end

end
