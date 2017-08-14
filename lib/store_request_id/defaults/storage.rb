# frozen_string_literal: true

module StoreRequestId
  module Defaults
    module Storage
      DEFAULT_KEY = 'X-Request-Id'.freeze
      private_constant :DEFAULT_KEY

      class << self
        def generate_key
          header_key.downcase.tr('-', '_').to_sym
        end

        private

        def header_key
          request_id_class = ::ActionDispatch::RequestId
          defined?(request_id_class::X_REQUEST_ID) ? request_id_class::X_REQUEST_ID : DEFAULT_KEY
        end
      end
    end
  end
end
