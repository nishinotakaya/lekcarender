class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :contentheroku
      t.text :content_1
      t.text :content_2
      t.text :content_3
      t.date :start_time
      t.timestamps
      t.references :user, foreign_key: true
    end  
  end
end
