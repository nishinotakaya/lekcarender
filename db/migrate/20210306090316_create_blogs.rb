class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.text :content_1
      t.text :content_2
      t.text :content_3
      t.datetime :start_time

      t.timestamps
    end
  end
end
