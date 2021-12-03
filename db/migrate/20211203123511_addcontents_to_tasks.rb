class AddcontentsToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :contents, :string
    add_column :tasks, :copywarehouse, :string
  end
end
