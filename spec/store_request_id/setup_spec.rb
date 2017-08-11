require 'spec_helper'

describe StoreRequestId::Setup do
  let(:fake_config) do
    class Configuration
      attr_accessor :city
    end
    Configuration
  end

  let(:fake_module) do
    module FakeModule
      extend StoreRequestId::Setup
    end
  end

  before(:each) do
    allow_any_instance_of(described_class).to receive(:configuration) do
      @configuration ||= fake_config.new
    end
  end

  context 'configuration access' do
    it { expect(fake_module.configuration).to be_truthy }
  end

  context 'configuration set' do
    context 'with configuration' do
      before(:each) do
        fake_module.configuration.city = 'Naboo'
      end

      it { expect(fake_module.configuration.city).to eq('Naboo') }
    end

    context 'with configure block' do
      before(:each) do
        fake_module.configure do |config|
          config.city = 'Tatooine'
        end
      end

      it { expect(fake_module.configuration.city).to eq('Tatooine') }
    end
  end
end
