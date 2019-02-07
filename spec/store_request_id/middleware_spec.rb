require 'spec_helper'
require 'securerandom'
require 'action_dispatch'
require 'store_request_id/middleware'

describe StoreRequestId::Middleware do

  let(:app) do
    -> env { [200, env, ':)' ] }
  end

  let(:stack) {
    described_class.new(app)
  }

  let(:request) do
    Rack::MockRequest.new(stack)
  end

  let(:response) do
    request.get('/', env)
  end

  context 'StoreRequestId.request_id' do
    let(:uuid) { SecureRandom.uuid }
    let(:env) do
      # Any Rails app would inject this header before us
      # This is done because ActionDispatch::RequestId middleware
      # happen in the initial processing of the request
      { 'action_dispatch.request_id' => uuid }
    end

    it 'persist the header on .request_id' do
      expect(response.status).to be 200
      expect(StoreRequestId.request_id).to eq(uuid)
    end

  end
end
