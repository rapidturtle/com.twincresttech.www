source 'http://rubygems.org'

gem 'rails', '3.2.21'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier',     '>= 1.0.3'
end

gem 'acts_as_list'
gem 'carrierwave'
gem 'jquery-rails'
gem 'rmagick'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
gem 'unicorn', groups: [:staging, :production]

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

# Test suite
gem 'cucumber-rails', require: false, groups: [:development, :test]
gem 'rspec-rails', groups: [:development, :test]
group :test do
  # gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'guard-cucumber'
  gem 'guard-pow'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'spork'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end
