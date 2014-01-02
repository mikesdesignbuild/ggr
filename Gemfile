source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

group :development do   #, :test do
    gem "sqlite3"
    gem "better_errors"
    gem "binding_of_caller"
    gem "faker"  # to create sample data 
end

group :production do # , :staging do
   gem "pg", '0.12.2' # MP gets error: when bundle install --without "production".  Seems to try to install pg when it shouldn't.
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# https://github.com/adzap/validates_timeliness
gem 'validates_timeliness', '~> 3.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Use bootstrap
gem "therubyracer"
gem "less-rails"
gem 'less-rails-bootstrap'

gem 'devise'

# to open all emails in development mode in a browser for review
gem "letter_opener", :group => :development  

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
