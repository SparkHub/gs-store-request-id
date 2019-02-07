# frozen_string_literal: true

module StoreRequestId
  # Blue/Green accessors
  module BlueGreen
    HEADER = 'X-GS-BGEnv'.freeze

    def blue_green
      storage[HEADER]
    end

    def blue_green=(value)
      storage[HEADER] = value
    end

    private_constant :HEADER

    private

    def storage
      configuration.storage
    end
  end
end
