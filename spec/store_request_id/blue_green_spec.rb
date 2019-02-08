# frozen_string_literal: true

require 'spec_helper'
require 'action_dispatch'

describe StoreRequestId::BlueGreen do
  context '#request_id' do
    it { expect(StoreRequestId).to respond_to(:blue_green) }
  end

  context '#blue_green=' do
    before(:each) do
      StoreRequestId.blue_green = nil
    end

    let(:bg) do
      'blue'
    end
    it 'should set the new value' do
      expect{ StoreRequestId.blue_green = bg }.to \
        change{ StoreRequestId.blue_green }.to(bg)
    end
  end
end
