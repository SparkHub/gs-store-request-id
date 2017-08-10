# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StoreRequestId do
  it 'has a version number' do
    expect(StoreRequestId::VERSION).not_to be nil
  end
end
