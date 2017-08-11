# frozen_string_literal: true

require 'store_request_id/version'
require 'store_request_id/setup'
require 'store_request_id/request_id'

module StoreRequestId
  extend Setup
  extend RequestId
end

require 'store_request_id/rails' if defined?(Rails::Railtie)
