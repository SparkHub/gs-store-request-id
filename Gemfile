source 'https://registry.guidespark.net/repository/gs-rubygems-full'

# Specify your gem's dependencies in store_request_id.gemspec
gemspec

group :development, :test do
  gem 'reek', RUBY_VERSION >= '2.1.0' ? '>= 4' : '< 4', require: false
  gem 'rubocop', RUBY_VERSION >= '2.0.0' ? '>= 0.48.1' : '< 0.48.1', require: false
end

group :test do
  gem 'codeclimate-test-reporter', require: false if RUBY_VERSION >= '2.0'
  gem 'request_store', '>= 1.1'
  gem 'simplecov', require: false
end
