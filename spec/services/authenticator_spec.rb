require 'rails_helper'

RSpec.describe Authenticator do
  let(:payload) { 'rspec' }
  let(:encripted_payload) { described_class.new(payload).encode }

  describe '#encode' do
    before do
      @authenticator = described_class.new(payload)
    end

    it 'returns the payload encoded' do
      expect(@authenticator.encode).to eq(JWT.encode(payload, ENV['JWS_SECRET_TOKEN'], 'HS256'))
    end
  end

  describe '#decode' do
    before do
      @authenticator = described_class.new(encripted_payload)
    end

    it 'returns the payload decoded' do
      expect(@authenticator.decode).to eq(JWT.decode(encripted_payload, ENV['JWS_SECRET_TOKEN'], 'HS256'))
    end
  end
end
