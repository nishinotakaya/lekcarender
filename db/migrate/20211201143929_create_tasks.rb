class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :classification, comment: "タスク分類"
      t.string :total, comment: "会計"
      t.string :manager, comment: "担当者"
      t.string :inc, comment: "インシデント"
      t.string :title, comment: "件名"
      t.string :st, comment: "ステータス"
      t.string :edi, comment: "EDI"
      t.date :firstshipping, comment: "初回出荷"
      t.date :firststock, comment: "初回入荷"
      t.date :finishwarehouse, comment: "倉庫終了"
      t.string :integrationinstance, comment: "統合インスタンス"
      t.string :hubinstance, comment: "拠点インスタンス"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
