class Blogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.timestamps
      t.references :user, foreign_key: true
    end  
  end
end
