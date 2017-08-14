require 'spec_helper'
require 'securerandom'

describe StoreRequestId::Store do
  context 'inheritance' do
    it { expect(described_class).to be < SimpleDelegator }
  end

  context 'instantiation' do
    it { expect{ described_class.new }.to raise_error(ArgumentError) }
    it { expect(described_class.new({})).to be_truthy }
  end

  context 'instance methods' do
    context '#caller' do
      subject { described_class.new(obj) }
      let(:value) { SecureRandom.hex(5) }

      context 'with proc' do
        let(:obj) { proc { value } }

        it { expect(subject.caller).to eq(value) }
      end

      context 'with no proc' do
        let(:obj) { value }

        it { expect(subject.caller).to eq(value) }
      end
    end
  end
end
