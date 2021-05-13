class AddnameHToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :name_h, :string
    add_column :clients, :sex, :string
  end
end
