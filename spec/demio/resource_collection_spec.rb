# frozen_string_literal: true

require 'spec_helper'

describe Demio::ResourceCollection do
  describe '#data' do
    it 'returns empty data for invalid input' do
      resource = described_class.new('')
      expect(resource.count).to be(0)
    end

    it 'parses data correctly' do
      data = [{ name: 'My first Event' }]

      resource = described_class.new(data)
      expect(resource.first.name).to eql 'My first Event'
    end
  end
end
