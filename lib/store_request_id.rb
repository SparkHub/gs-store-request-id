# frozen_string_literal: true

require 'store_request_id/version'
require 'store_request_id/setup'
require 'store_request_id/store'
require 'store_request_id/request_id'
require 'store_request_id/blue_green'

module StoreRequestId
  extend Setup
  extend RequestId
  extend BlueGreen
end

require 'store_request_id/rails' if defined?(Rails::Railtie)
