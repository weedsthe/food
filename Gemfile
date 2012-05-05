source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mongoid', "~> 2.4"
gem 'bson_ext', "~> 1.5"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'haml-rails'
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'guard-rspec'
  gem 'guard-spork'
  # gem 'thin'
end

group :test, :development do
  gem 'fabrication'
  gem "rspec-rails", "~> 2.6"
  gem 'spork'
  gem 'libnotify' if /linux/ =~ RUBY_PLATFORM
  gem 'growl' if /darwin/ =~ RUBY_PLATFORM
  gem 'pry-rails'
end

group :test do
  gem 'capybara'
  gem 'mongoid-rspec'
  gem 'database_cleaner'
  gem "json_spec"
  # gem 'factory_girl_rails'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
