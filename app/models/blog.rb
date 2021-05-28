class Blog < ApplicationRecord
  belong_to :user
  has_many :planning_papers 
end
