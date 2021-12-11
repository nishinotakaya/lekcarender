class AddUserIdToLanguages < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :user_id, :integer
  end
end
