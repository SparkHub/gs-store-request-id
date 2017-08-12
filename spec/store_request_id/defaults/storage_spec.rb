require 'spec_helper'
require 'action_dispatch/middleware/request_id'

describe StoreRequestId::Defaults::Storage do
  context 'class methods' do
    context '#generate_key' do
      context 'with defined :X_REQUEST_ID' do
        it { expect(described_class.generate_key).to be_truthy }
      end

      context 'with undefined :X_REQUEST_ID' do
        before(:each) do
          ActionDispatch::RequestId.send(:remove_const, 'X_REQUEST_ID') if RUBY_VERSION >= '2.2.2'
          described_class.send(:remove_const, 'DEFAULT_KEY')
          described_class::DEFAULT_KEY = 'My-Key'
        end

        it { expect(described_class.generate_key).to eq(:my_key) }
      end
    end
  end
end
