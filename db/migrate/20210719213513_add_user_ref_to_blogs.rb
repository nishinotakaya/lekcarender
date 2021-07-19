class AddUserRefToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogsses, :user, null: false, foreign_key: true
  end
end
