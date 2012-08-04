source 'http://rubygems.org'

gem 'rails', '4.0.2'

gem 'pg'

gem 'faye'
gem 'thin'

# State Machine
gem 'state_machine'

# Configuration
gem 'persey'

gem 'haml-rails'
gem 'ransack'
gem 'simple_form'
gem 'js-routes'
gem 'kaminari'
gem 'select2-rails'
gem 'angularjs-rails'
gem 'angularjs-rails-resource', '0.2.4'
gem 'underscore-rails'
gem 'bootstrap-datepicker-rails'

gem 'nokogiri'
gem 'airbrake'

# Authentication
gem 'omniauth-facebook'
gem 'omniauth-github'

gem 'sinatra', require: false
gem 'virtus'
gem 'draper'

gem 'active_model_serializers'
gem 'rails-observers'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'jquery-ui-rails'
  gem 'sass-rails'
  gem 'coffee-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes

  gem 'uglifier', '>= 1.0.3'
end

gem 'less-rails'
gem 'therubyracer', :platforms => :ruby
gem 'jquery-rails'
gem 'mail_sandbox', '~> 0.1.2'
gem 'unicorn-rails'
gem 'twitter-bootstrap-rails'
gem 'mail'
gem 'squeel'

gem 'validates'

group :test do
  gem 'minitest-reporters'
  gem 'turn'
  gem 'factory_girl_rails', require: false
  gem 'tconsole'
  gem 'simplecov','0.7.1', require: false
  gem 'mocha', require: false
  gem 'wrong'
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.1'

# Use unicorn as the app server
gem 'unicorn', group: :unicorn
gem 'puma', group: :puma

group :development do
  gem 'letter_opener_web'
  gem 'vendorer'
  # Deploy
  gem 'capistrano', '~> 3.0'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler'
end

group :develop, :test do
  gem 'pry-rails'
end
