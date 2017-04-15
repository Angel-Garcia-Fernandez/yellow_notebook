source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.13', '< 0.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.
# com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', '~> 3.6'  # this is not necessary because it is a dependency of capistrano-rails, but it fix capistrano
                              # version which is important
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  # gem 'capistrano-ssh-doctor' # In capfile: require 'capistrano/ssh_doctor'
  #                             # execute: $ bundle exec cap production ssh:doctor
  gem 'capistrano-passenger'
  gem 'capistrano-db-tasks', require: false # Gives some task to pull or push database from local to server and vice versa.
                                            # For a list of tasks: https://github.com/sgruhier/capistrano-db-tasks
  gem 'capistrano-rails-collection'
end

# Environment variables configuration in application.yml with figaro.
# $ bundle exec figaro install
gem 'figaro', '~>1.0'

# YARD is a Ruby Documentation tool.
gem 'yard'

# Devise is a flexible authentication solution for Rails with Warden.
# $ bundle exec rails generate devise:install
gem 'devise'

# i18n support
gem 'rails-i18n'#, github: 'svenfuchs/rails-i18n', branch: 'rails-4-x' # For 4.x
gem 'devise-i18n'

# yes/no for booleans with i18n translations
gem 'humanize_boolean'

# support for static pages
gem 'high_voltage'

# Bootstrap
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'bootstrap-generators' # add bootstrap generators for scaffolding.
gem 'bootstrap-sass-extras' # add some extras included in twitter-bootstrap-sass to bootstrap-sass.
                              # $ rails g bootstrap:themed Posts
                              # that regenerate the old scaffold views to the bootstrap ones.ç
gem 'devise-bootstrap-views'
# Select2 support
gem 'select2-rails'
# bootstrap datepicker support
gem 'momentjs-rails'#, '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails'#, '~> 4.17.42'

#annotate database schema in models: bundle exec annotate
gem 'annotate'

# In Rubymine, using the debugger implies  commenting byebug and instaling debase gems.
# group :development, :test do
#   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
#   gem 'byebug', platform: :mri
# end
gem 'debase'
gem 'ruby-debug-ide'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# PDF support
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary-edge', '~> 0.12.3.0' # wkhtmltopdf installer for wicked_pdf

# Activerecord any_of: OR for scopes
gem 'activerecord_any_of'

# Paperclip for uploading files
gem 'paperclip', '~> 5.1.0'

# nested fields for form with has many
gem 'nested_form_fields'


# XLSX support
gem 'roo', '~> 2.7.0'
gem 'roo-xls'
gem 'rubyzip', '~> 1.1.0'
gem 'axlsx', '2.1.0.pre'
# gem 'axlsx_rails'
#gem install acts_as_xlsx, git: 'https://github.com/straydogstudio/acts_as_xlsx'