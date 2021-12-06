class Task < ApplicationRecord
  belongs_to :user
  require 'csv'
  scope :search_task, -> (search_params) do
    return if search_params.blank?

      task_inc(search_params[:inc])
      .task_title(search_params[:title])
      .task_total(search_params[:total])
      .task_classification(search_params[:classification])
  end
  scope :task_inc, -> (inc) { where('inc LIKE ?', "%#{inc}%") if inc.present? }
  scope :task_title, -> (title) { where('cast(title as text) LIKE ?', "%#{title}%") if title.present?  }
  scope :task_total, -> (total) { where('total LIKE ?', "%#{total}%") if total.present? }
  scope :task_classification, -> (classification) { where('classification LIKE ?', "%#{classification}%") if classification.present? }

  def self.export
    CSV.generate(row_sep: "\r\n", encoding:Encoding::CP932, force_quotes: true)  do |csv|
      header = %w(分類 会計 担当者 インシデント 件名 内容 倉庫コード コピー元倉庫 初回出荷 初回入荷 初回終了 統合インスタンス 拠点インスタンス)
      csv << header
      all.each do |task|
        values = [
          task.classification,
          task.total,
          task.manager,
          task.inc,
          task.title,
          task.contents,
          task.warehousecode,
          task.copywarehouse,
          task.firstshipping,
          task.firststock,
          task.finishwarehouse,
          task.integrationinstance,
          task.hubinstance
        ]
        csv << values
      end
    end
  end

end
