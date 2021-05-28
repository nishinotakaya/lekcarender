class Blog < ApplicationRecord
  belong_to :user, foreign_key: :user_id
  has_many :planning_papers 
end
