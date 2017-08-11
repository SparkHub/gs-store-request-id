require 'spec_helper'
require 'action_dispatch/middleware/request_id'

describe StoreRequestId::Configuration do
  context 'instantiation' do
    it { expect(described_class.new).to be_truthy }
  end

  context 'attributes' do
    context '#request_store_key' do
      subject { described_class.new }

      context 'setter' do
        before(:each) do
          subject.request_store_key = 'my_new_key'
        end

        it { expect(subject.request_store_key).to eq('my_new_key') }
      end

      context 'getter' do
        it { expect(subject.request_store_key).to be_truthy }
      end
    end
  end
end
