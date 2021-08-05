source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'faraday', '~> 1.6'
gem 'faraday_middleware', '~> 1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop', '~> 1.18', '>= 1.18.4'
  gem 'rubocop-rspec', '~> 2.4'
end

group :test do
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'vcr', '~> 6.0'
  gem 'webmock', '~> 3.13'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
