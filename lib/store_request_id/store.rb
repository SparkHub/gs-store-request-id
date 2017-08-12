# frozen_string_literal: true

require 'delegate'

module StoreRequestId
  class Store < SimpleDelegator
    # :reek:ManualDispatch
    def caller
      respond_to?(:call) ? call : self
    end
  end
end
