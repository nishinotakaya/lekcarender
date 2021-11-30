class AddColumnLekUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :lek_urls, :body, :text
    add_column :lek_urls, :youtube_url, :string
  end
end
