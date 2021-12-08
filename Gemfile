source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'google-api-client', '~> 0.11'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3'
end
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'omniauth-line'
gem 'dotenv-rails'
gem 'omniauth', '~> 1.9.1'
gem 'bootstrap_form'
gem 'annotate'
gem 'materialize-sass', '~> 1.0.0'
gem 'material_icons'
gem 'axlsx'
gem 'zip-zip'

gem 'image_processing', '~> 1.2'
gem 'mini_magick'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'debase'
  gem 'ruby-debug-ide'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'hirb'
  gem 'hirb-unicode'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
    # エラー画面をわかりやすく整形してくれる
  gem 'better_errors'
  # better_errorsの画面上にirb/pry(PERL)を表示する
  gem 'binding_of_caller'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end
gem 'simple_calendar', '~> 2.0'
gem 'bootstrap', '~> 5.0.0.beta2'
gem 'jquery-rails'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'wareki'
gem 'rails-i18n'
gem 'devise'
gem 'devise-i18n'
group :production do
  gem 'pg', '0.20.0'
end

gem 'seed_dump'
gem 'active_decorator'
