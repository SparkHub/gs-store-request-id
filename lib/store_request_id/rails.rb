# frozen_string_literal: true

require 'store_request_id/middleware'

module StoreRequestId
  class Railtie < Rails::Railtie
    initializer 'store_request_id.configure_rails_initialization' do
      Rails.application.middleware.insert_after ActionDispatch::RequestId,
                                                StoreRequestId::Middleware
      Rails.application.middleware.insert_after StoreRequestId::Middleware,
                                                StoreRequestId::BlueGreenMiddleware
    end
  end
end
