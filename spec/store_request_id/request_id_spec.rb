require 'spec_helper'
require 'securerandom'
require 'active_support/concern'
require 'active_support/deprecation'
require 'action_dispatch/http/mime_type'
require 'action_dispatch/http/request'
require 'action_dispatch/middleware/request_id'

describe StoreRequestId::RequestId do
  context '#request_id' do
    it { expect(StoreRequestId).to respond_to(:request_id) }
  end

  context '#request_id=' do
    let(:uuid) { SecureRandom.uuid }

    it 'should set the new value' do
      expect{ StoreRequestId.request_id = uuid }.to \
        change{ StoreRequestId.request_id }.to(uuid)
    end
  end
end
