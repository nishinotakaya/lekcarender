class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.text :content_1
      t.text :content_2
      t.text :content_3
      t.date :start_time
      t.belongs_to :user, null: false, foreign_key: {to_table: :users} 
      t.timestamps
    end  
  end
end
