# frozen_string_literal: true

require 'spec_helper'

describe Demio::Resource do
  describe '#data' do
    let(:data) { { name: 'My first Event' } }

    it 'returns empty data for invalid input' do
      resource = described_class.new('')
      expect(resource.data.to_h).to eql({})
    end

    it 'parses data correctly' do
      resource = described_class.new(data)
      expect(resource.data[:name]).to eql 'My first Event'
    end

    it 'adds getters for data' do
      resource = described_class.new(data)
      expect(resource.name).to eql 'My first Event'
    end
  end
end
