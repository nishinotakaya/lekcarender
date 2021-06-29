class Blog < ApplicationRecord
  belongs_to :user
  has_many :planning_papers 
end
