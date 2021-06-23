class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.date :birthday
      t.string :use_day
      
      t.timestamps
    end
  end
end
