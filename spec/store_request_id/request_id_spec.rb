require 'spec_helper'
require 'securerandom'

describe StoreRequestId::RequestId do
  let(:fake_module) do
    module FakeRequestIdModule
      extend StoreRequestId::RequestId

      def self.configuration
        OpenStruct.new(request_store_key: :default_key)
      end
    end
    FakeRequestIdModule
  end

  context '#request_id' do
    it { expect(fake_module).to respond_to(:request_id) }
  end

  context '#request_id=' do
    let(:uuid) { SecureRandom.uuid }

    it 'should set the new value' do
      expect{ fake_module.request_id = uuid }.to \
        change{ fake_module.request_id }.from(nil).to(uuid)
    end
  end
end
