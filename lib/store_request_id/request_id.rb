# frozen_string_literal: true

module StoreRequestId
  module RequestId
    def request_id
      storage[storage_key]
    end

    def request_id=(value)
      storage[storage_key] = value
    end

    private

    def storage
      configuration.storage
    end

    def storage_key
      configuration.storage_key
    end
  end
end
