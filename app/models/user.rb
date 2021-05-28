class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
        #  :authentication_keys => [];
        #  :validatable
  
  has_many :blogs
  # accepts_nested_attributes_for :blogs
end
