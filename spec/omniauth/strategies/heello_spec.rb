require 'spec_helper'

describe OmniAuth::Strategies::Heello do
  subject do
    OmniAuth::Strategies::Heello.new({})
  end

  context 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('heello')
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://api.heello.com')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('/oauth/authorize')
    end
  end
end