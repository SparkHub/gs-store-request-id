# frozen_string_literal: true

require_relative 'defaults/storage'

module StoreRequestId
  # :reek:Attribute
  # :reek:InstanceVariableAssumption
  class Configuration
    attr_accessor :storage_key

    def storage
      @storage.caller
    end

    def storage=(store)
      @storage = Store.new(store)
    end

    private

    def initialize
      self.storage_key = Defaults::Storage.generate_key
      self.storage     = proc { Thread.current }
    end
  end
end
