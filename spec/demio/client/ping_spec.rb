# frozen_string_literal: true

require 'spec_helper'

describe Demio::Client::Ping, integration: true do
  let(:client) { Demio::Client.new }

  describe '#ping' do
    subject { client.ping }

    it { is_expected.to have_attributes(pong: true) }
  end
end
