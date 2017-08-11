# frozen_string_literal: true

module StoreRequestId
  module RequestId
    def request_id
      RequestStore[configuration.request_store_key]
    end

    def request_id=(value)
      RequestStore[configuration.request_store_key] = value
    end
  end
end
