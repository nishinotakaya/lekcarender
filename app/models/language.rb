class Language < ApplicationRecord
  has_rich_text :content
  belongs_to :user

  scope :search_language, -> (search_params) do
    return if search_params.blank?

      
    language_title(search_params[:title])
    .language_meaning(search_params[:meaning])
  end
  scope :language_title, -> (title) { where('cast(title as text) LIKE ?', "%#{title}%") if title.present?  }
  scope :language_meaning, -> (meaning) { where('meaning LIKE ?', "%#{meaning}%") if meaning.present? }
end
