class Task < ApplicationRecord
  belongs_to :user

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
end
