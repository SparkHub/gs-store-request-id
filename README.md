[![Gem Version](https://badge.fury.io/rb/store_request_id.svg)](http://badge.fury.io/rb/store_request_id)
[![Build Status](https://travis-ci.org/SparkHub/gs-store-request-id.svg?branch=master)](https://travis-ci.org/SparkHub/gs-store-request-id)
[![Code Climate](https://codeclimate.com/github/SparkHub/gs-store-request-id/badges/gpa.svg)](https://codeclimate.com/github/SparkHub/gs-store-request-id)
[![Test Coverage](https://codeclimate.com/github/SparkHub/gs-store-request-id/badges/coverage.svg)](https://codeclimate.com/github/SparkHub/gs-store-request-id/coverage)
[![Issue Count](https://codeclimate.com/github/SparkHub/gs-store-request-id/badges/issue_count.svg)](https://codeclimate.com/github/SparkHub/gs-store-request-id)
[![Dependency Status](https://gemnasium.com/SparkHub/gs-store-request-id.svg)](https://gemnasium.com/SparkHub/gs-store-request-id)

# StoreRequestId

Middleware storing the unique [requestId](https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/request_id.rb) into a global value in order to access it anytime.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'store_request_id', '~> 0.4.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install store_request_id

_**Using without rails:** If you're not using Rails, you need to insert `StoreRequestId::Middleware` into your middleware stack._

## Usage

By default, `Thread.current` will be used as a data store. The `request_id` will be stored within a `:x_request_id` key. This value can be accessed wherever in the code with `StoreRequestId.request_id`.

## Configuration

- **Storage object**

The storage can be changed. Storage objects must have `[]` and `[]=` methods. A proc should be sent to the configuration.
Here is an example with the [RequestStore gem](https://github.com/steveklabnik/request_store).
```ruby
# RequestStore needs to be installed prior
# Gemfile
gem 'request_store', '~> 1.1'

# config/initializers/store_request_id.rb
StoreRequestId.configuration.storage = proc { RequestStore }
# OR
StoreRequestId.configure do |config|
  config.storage = proc { RequestStore }
end
```

- **Storage key**

If for some reason you want to personalize that key (collision for example), you can do so with:
```ruby
# config/initializers/store_request_id.rb
StoreRequestId.configuration.storage_key = :my_key
# OR
StoreRequestId.configure do |config|
  config.storage_key = :my_key
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
