require_relative 'boot'

require 'rails/all'
require 'google/apis/youtube_v3' #YoutubeV3を使用するために、呼び出す

youtube = Google::Apis::YoutubeV3::YouTubeService.new
youtube.key = "AIzaSyCO8V-rrEbdMMyXeCSrma650RAwJ_p9XW0"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LekCarenderEnviroment
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.time_zone = 'Asia/Tokyo' 
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.default_locale = :ja
    config.assets.initialize_on_precompile = false
    config.beginning_of_week = :sunday
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end
