# frozen_string_literal: true

module StoreRequestId
  class Configuration
    # :reek:Attribute
    attr_accessor :request_store_key

    private

    def initialize
      self.request_store_key = store_key
    end

    def header_key
      request_id_class = ::ActionDispatch::RequestId
      defined?(request_id_class::X_REQUEST_ID) ? request_id_class::X_REQUEST_ID : 'X-Request-Id'
    end

    def store_key
      header_key.downcase.tr('-', '_').to_sym
    end
  end
end
