require 'spec_helper'
require 'securerandom'
require 'request_store'
require 'action_dispatch/middleware/request_id'

describe StoreRequestId::Configuration do
  context 'instantiation' do
    it { expect(described_class.new).to be_truthy }
  end

  context 'attributes' do
    context '#storage_key' do
      subject { described_class.new }

      context 'setter' do
        before(:each) do
          subject.storage_key = 'my_new_key'
        end

        it { expect(subject.storage_key).to eq('my_new_key') }
      end

      context 'getter' do
        it { expect(subject.storage_key).to be_truthy }
      end
    end

    context '#storage' do
      subject { described_class.new }

      context 'with default storage' do
        context 'getter' do
          it { expect(subject.storage).to be_a(Thread) }
        end

        context 'setter' do
          let(:value) { SecureRandom.hex(5) }

          before(:each) do
            StoreRequestId.request_id = value
          end

          it { expect(Thread.current[subject.storage_key]).to eq(value) }
        end
      end

      context 'with a personalized storage' do
        context 'without `[]` nor `[]=` accessor' do
          before(:each) do
            allow_any_instance_of(described_class).to receive(:storage) { nil }
          end

          it { expect{ StoreRequestId.request_id }.to raise_error(NoMethodError) }
        end

        context 'with required accessors/setters' do
          before(:each) do
            allow_any_instance_of(described_class).to receive(:storage) { RequestStore }
          end

          context 'getter' do
            it { expect(StoreRequestId.configuration.storage.inspect).to eq('RequestStore') }
          end

          context 'setter' do
            let(:value) { SecureRandom.hex(5) }

            before(:each) do
              StoreRequestId.request_id = value
            end

            it { expect(RequestStore[StoreRequestId.configuration.storage_key]).to eq(value) }
          end
        end
      end
    end
  end
end
