source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem "active_model_serializers", "~> 0.8.1"

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem "mysql2", "~> 0.3.11"
end

group :production do
  gem 'pg'
end

group :test do
  gem 'factory_girl_rails', '4.2.0'
  gem 'faker', '1.1.2'
  gem 'capybara', '2.1.0'
end

# Use debugger
gem 'debugger', group: [:development, :test]
