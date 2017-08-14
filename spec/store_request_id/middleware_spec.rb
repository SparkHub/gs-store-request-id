require 'spec_helper'
require 'securerandom'
require 'active_support/concern'
require 'active_support/deprecation'
require 'action_dispatch/http/mime_type'
require 'action_dispatch/http/request'
require 'store_request_id/middleware'
require 'action_dispatch/middleware/request_id'

describe StoreRequestId::Middleware do
  let(:app) { described_class.new(->env { ':)' }) }

  context 'instantiation' do
    it 'passes non-error responses through' do
      expect(app.call({})).to eq(':)')
    end
  end

  context 'store request id' do
    let(:uuid) { SecureRandom.uuid }

    it 'should store the request id within a global storage' do
      app.call('action_dispatch.request_id' => uuid)
      expect(StoreRequestId.request_id).to eq(uuid)
    end
  end
end
