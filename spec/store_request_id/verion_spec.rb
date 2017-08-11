# frozen_string_literal: true

require 'spec_helper'

describe StoreRequestId do
  context 'version' do
    it { expect(StoreRequestId::VERSION).not_to be(nil) }
  end
end
