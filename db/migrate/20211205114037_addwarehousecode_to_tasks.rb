class AddwarehousecodeToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :warehousecode, :string, comment: "倉庫コード"
  end
end
