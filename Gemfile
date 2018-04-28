source 'https://rubygems.org'
ruby '2.4.1'


gem 'foreman'
# Web server
gem 'puma'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0'
# Use postgresql as the database for Active Record
gem 'pg', '< 1.0'
# Indentation-based html templating
gem 'haml-rails'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'
# Needed for Bootstrap
gem 'bootstrap-sass', '~> 3.3.4'
# Improved select boxes
gem 'select2-rails'
# Markdown
gem 'redcarpet', '~> 3.3.4'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster.
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Backend browser detection
gem 'browser'
# Form DSL
gem 'simple_form'
# Normalize model attributes
gem 'attribute_normalizer'
# Use ActiveModel has_secure_password
gem 'bcrypt'
# Moves authentication logic to one location
gem 'cancancan'
# Makes browsers render all elements more consistently
gem 'normalize-rails'
# Record past states of models
gem 'paper_trail'
# Diffing
gem 'diffy'
# Inline editor
gem 'mercury-rails', github: 'jejacks0n/mercury'
# PDF Generation
gem 'prawn'
gem 'prawn-table'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', group: :doc
end

group :development, :test do
  # Fixtures replacement for generating data
  gem 'factory_bot_rails'
  # Generate lorem ipsum
  gem 'faker'
  # Rails console replacement
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'capybara'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Adds schema info to models with annotate command
  gem 'annotate'
  # Monitor source code for changes
  gem 'listen'
end

group :production do
  # Needed for Heroku
  gem 'rails_12factor'
end
