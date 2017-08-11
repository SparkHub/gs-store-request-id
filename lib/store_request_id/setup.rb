# frozen_string_literal: true

require_relative 'configuration'

module StoreRequestId
  module Setup
    def configuration
      @configuration ||= self::Configuration.new
    end

    def configure
      yield(configuration)
    end

    private

    attr_writer :configuration
  end
end
