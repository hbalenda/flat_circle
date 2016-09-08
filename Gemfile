source 'https://rubygems.org'

gem 'rails', github: 'rails/rails'

# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', :require => 'rack/cors'
# Used for encrypting User passwords
gem 'bcrypt'
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'
gem 'raddocs'
gem 'sinatra', github: 'sinatra/sinatra'

group :development, :test do
  gem 'faker'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'rspec_api_documentation'
end

group :test do
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'factory_girl_rails'
  gem 'shoulda'
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
