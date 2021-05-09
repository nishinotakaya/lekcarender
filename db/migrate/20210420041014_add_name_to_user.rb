class AddNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :t_json, :json
    add_column :users, :text_memo_2, :string
    add_column :users, :text_memo_3, :string
    add_column :users, :text_memo_4, :string
    add_column :users, :text_check, :boolean
  end
end
