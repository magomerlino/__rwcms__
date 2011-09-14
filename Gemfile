source 'http://rubygems.org'

gem 'rails', '3.1.0'

gem 'jruby-openssl'
gem 'json'

group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

platforms :jruby do
  gem 'activerecord-oracle_enhanced-adapter'
  gem 'ruby-plsql'
  group :assets do
  	# the javascript engine for execjs gem
    gem 'therubyrhino'
  end

  group :development do
	gem 'activerecord-jdbcsqlite3-adapter'
  end
end
