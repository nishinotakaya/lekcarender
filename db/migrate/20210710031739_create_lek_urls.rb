class CreateLekUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :lek_urls do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
