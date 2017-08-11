# frozen_string_literal: true

module StoreRequestId
  class Middleware
    def call(env)
      req = ::ActionDispatch::Request.new(env)
      RequestStore.store[StoreRequestId.configuration.request_store_key] = req.uuid
      @app.call(env)
    end

    private

    def initialize(app)
      @app = app
    end
  end
end
