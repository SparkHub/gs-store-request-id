# frozen_string_literal: true

module StoreRequestId
  class Middleware
    def call(env)
      req = ::ActionDispatch::Request.new(env)
      StoreRequestId.request_id = req.uuid
      @app.call(env)
    end

    private

    def initialize(app)
      @app = app
    end
  end
end
