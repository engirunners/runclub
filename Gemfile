# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1.2'

gem 'activeadmin'
gem 'activeadmin_quill_editor'
gem 'activeadmin-searchable_select'
gem 'active_storage_validations'
gem 'bootsnap', require: false
gem 'bootstrap'
gem 'devise'
gem 'font-awesome-sass'
gem 'importmap-rails'
gem 'pg'
gem 'puma'
gem 'rails-i18n'
gem 'rails_performance'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'

group :development do
  gem 'capistrano', '~> 3.17', require: false
  gem 'capistrano3-nginx', '~> 2.0', require: false
  gem 'capistrano3-puma', '6.0.0.beta.1', require: false
  gem 'capistrano-bundler', '~> 2.0', require: false
  gem 'capistrano-rails', '~> 1.6', require: false
  gem 'capistrano-rbenv', '~> 2.2', require: false
  gem 'database_consistency', require: false

  gem 'bcrypt_pbkdf', '~> 1.0'
  gem 'ed25519', '~> 1.3'
end

group :development, :test do
  gem 'byebug'
  gem 'rubocop', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
end
