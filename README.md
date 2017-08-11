[![Gem Version](https://badge.fury.io/rb/gs-store-request-id.svg)](http://badge.fury.io/rb/gs-store-request-id)
[![Build Status](https://travis-ci.org/SparkHub/gs-store-request-id.svg?branch=master)](https://travis-ci.org/SparkHub/gs-store-request-id)
[![Code Climate](https://codeclimate.com/github/SparkHub/gs-store-request-id/badges/gpa.svg)](https://codeclimate.com/github/SparkHub/gs-store-request-id)
[![Test Coverage](https://codeclimate.com/github/SparkHub/gs-store-request-id/badges/coverage.svg)](https://codeclimate.com/github/SparkHub/gs-store-request-id/coverage)
[![Issue Count](https://codeclimate.com/github/SparkHub/gs-store-request-id/badges/issue_count.svg)](https://codeclimate.com/github/SparkHub/gs-store-request-id)
[![Dependency Status](https://gemnasium.com/SparkHub/gs-store-request-id.svg)](https://gemnasium.com/SparkHub/gs-store-request-id)

# StoreRequestId

Middleware storing the unique [requestId](https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/request_id.rb) into a [RequestStore](https://github.com/steveklabnik/request_store) in order to access it anytime.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'store_request_id', '~> 0.1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install store_request_id

_**Using without rails:** If you're not using Rails, you need to insert StoreRequestId::Middleware into your middleware stack._

## Usage

By default, the `RequestStore` key where the `request_id` is stored is `:x_request_id`. This value can be accessed wherever in the code with `RequestStore.store[:x_request_id]`. That key can be personalized as follow:
```ruby
# config/initializers/store_request_id.rb
StoreRequestId.configuration.request_store_key = :my_key
# OR
StoreRequestId.configure do |config|
  config.request_store_key = :my_key
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Running CI tools

To run rubocop:

    $ rubocop

To run reek:

    $ reek

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SparkHub/gs-store-request-id. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
