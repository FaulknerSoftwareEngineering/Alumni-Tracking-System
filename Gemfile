source 'https://rubygems.org'


 ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sassc-rails'
gem 'rails', '5.2.2'
gem 'rake', '13.0.0'

# Use SCSS for stylesheets
#gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.1'
# See https://github.com/rails/execjs#readme for more supported runtimes

gem 'mini_racer', platforms: :ruby

# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3.5'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.8.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
#Use bootstrap for styling
gem 'bootstrap', '~> 4.0.0'
#bootstrap gem requires sprockets-rails
#gem 'sprockets-rails', :require => 'sprockets/railtie'
#bootstrap also needs popper
gem 'popper_js', '~> 1.12.9'
#haml
gem 'haml'

#Google API Client
gem 'google-api-client'
gem 'omniauth-google-oauth2'
gem 'omniauth-oauth2'
#gem 'heroku_secrets', github: 'alexpeattie/heroku_secrets'
#ODF-Reports
gem 'odf-report'
#Rubyzip
gem 'rubyzip'
#For mail for support popup
gem 'mail', '~> 2.6', '>= 2.6.4'
gem 'mailgun-ruby', '~>1.1.6'
gem 'figaro'


#look a soruce of time zone data
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]


# chart library
gem 'chartkick'

# Pass data to JavaScript
gem 'gon'


group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~>1.3', '< 1.4'
  gem 'byebug'
  gem 'database_cleaner', '1.4.1'
  gem 'launchy'
  gem 'rspec-rails', '3.8.2'
  gem 'ZenTest', '4.11.2'
  gem 'rails-erd', '~>1.6.0'
  gem 'metric_fu'

end

group :test do
  gem 'cucumber-rails', :require=> false
  gem 'cucumber-rails-training-wheels'
end
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.2.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.2'
end
group :production do
  gem 'rails_12factor'
	gem 'pg'
end
