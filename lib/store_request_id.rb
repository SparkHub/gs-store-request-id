# frozen_string_literal: true

require 'store_request_id/version'
require 'store_request_id/setup'

module StoreRequestId
  extend Setup
end

require 'store_request_id/rails' if defined?(Rails::Railtie)
