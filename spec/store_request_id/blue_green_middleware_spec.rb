
require 'spec_helper'
require 'store_request_id/blue_green_middleware'
require 'action_dispatch'
require 'rack/test'

describe StoreRequestId::BlueGreenMiddleware do
  let(:app) do
    -> env { [200, env, ':)' ] }
  end

  let(:stack) {
    described_class.new(app)
  }

  let(:request) do
    Rack::MockRequest.new(stack)
  end

  let(:response) do
    request.get('/', env)
  end

  context 'Default to blue' do
    let(:env) do
      { }
    end
    it 'persist BG header in :bg' do
      expect(response.status).to eq(200)
      expect(
        StoreRequestId.blue_green
      ).to eq('blue')
    end
  end

  values = {
    'green' => 'green',
    'blue' => 'blue',
    'violet' => 'blue'
  }

  values.each do |input, expected|
    context "#{expected} when header says #{input}" do
      let(:env) do
        { 'X-GS-BGEnv' => input }
      end
      it 'persist BG header in :bg' do
        expect(response.status).to eq(200)
        expect(
          StoreRequestId.blue_green
        ).to eq(expected)
      end
    end
  end
end

