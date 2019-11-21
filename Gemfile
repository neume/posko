# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more:
# https :/ / github.com / turbolinks / turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get
  # a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.5'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'hirb'
  gem 'rubocop-rspec', require: false
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %>
  # anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'bcrypt_pbkdf', require: false # capistrano prerequisite
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-bundler', '~> 1.4', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-rbenv', '~> 2.1', require: false
  gem 'capistrano3-puma', require: false
  gem 'ed25519', require: false # capistrano prerequisite
  gem 'guard-rubocop'
  gem 'license_finder'
  gem 'railroady'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
group :test do
  gem 'database_cleaner'
  gem 'generator_spec'
  gem 'guard-rspec', require: false
  gem 'pdf-inspector', require: false
  gem 'rails-controller-testing'
  gem 'rspec-json_expectations', require: false
  gem 'shoulda-callback-matchers', '~> 1.1.1'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'timecop'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
## ActiverRecordLike
gem 'virtus'
## Authorization
# gem "cancancan", '~> 1.10'
gem 'pundit', '~> 1.1'

# datatable
gem 'ajax-datatables-rails', '0.4.0'
gem 'jquery-datatables-rails'

gem 'adminlte_theme'
gem 'bootstrap-sass', '3.4.1'
gem 'font-awesome-rails', '~> 4.7'
gem 'jquery-rails', '~> 4.3'

# Decorator
gem 'draper'

# Pagination
gem 'kaminari'
# gem "gretel"
# gem 'carrierwave', '~> 1.0'
# gem "cocoon"

gem 'queryko', path: '/Users/joseph/neume/queryko' #, '2.0.8'

# used for demo
gem 'faker'

# PDF generator
gem 'prawn'

gem 'barby'

gem 'select2-rails'

gem 'posko-browser'

gem 'sentry-raven'

gem 'blueprinter'

gem 'rack-cors'
gem 'json', '2.1.0'
