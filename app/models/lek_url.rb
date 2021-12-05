class LekUrl < ApplicationRecord
  # scope :search_youtube, -> (search_params) do
  #   return if search_params.blank?
  #     name_like(search_params[:items])
  # end
  # scope :name_like, -> (items) { where('items LIKE ?', "%#{items}%") if items.present? }
end
