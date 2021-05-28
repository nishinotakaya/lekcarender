class Blogs < ActiveRecord::Migration[6.0]
  def change
    t.timestamps
    t.references :user, foreign_key: true
  end
end
