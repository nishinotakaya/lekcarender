class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :name_h
      t.string :sex
      t.date :birthday
      t.string :use_day
      t.string :string

      t.timestamps
    end
  end
end
