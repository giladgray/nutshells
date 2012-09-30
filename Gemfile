source 'http://rubygems.org'

gem 'rails', '3.2.8'
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'font-awesome-sass-rails'
end
group :development do
  gem 'sqlite3'
  gem 'nifty-generators'
end
group :production do
  gem 'pg'
  gem 'thin'
end

gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'bootstrap-sass', '~> 2.1.0.0'
gem 'jquery-rails'
gem 'eco'
gem 'nokogiri'

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
  gem "mocha"
end