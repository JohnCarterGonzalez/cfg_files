gem_group :development, :test do 
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
end

gem_group :development do 
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
end

run "bundle install"

