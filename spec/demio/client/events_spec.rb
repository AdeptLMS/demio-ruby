# frozen_string_literal: true

require 'spec_helper'

describe Demio::Client::Events, integration: true do
  let(:client) { Demio::Client.new }

  describe '#events' do
    subject { client.events }

    it { is_expected.to be_instance_of(Demio::ResourceCollection) }
  end

  describe '#event' do
    subject { client.event(46_015) }

    it { is_expected.to be_instance_of(Demio::Resource) }
    it { is_expected.to have_attributes(id: 46_015, name: 'Test Event', registration_url: String, dates: Array) }
  end

  describe '#event_date' do
    subject { client.event_date(event_id: 46_015, date_id: 107_055) }

    it { is_expected.to be_instance_of(Demio::Resource) }
    it { is_expected.to have_attributes(date_id: 107_055, status: String, datetime: String) }
  end

  describe '#register' do
    let(:response) { client.register(options) }

    context 'with valid parameters' do
      subject { response }

      let(:options) do
        {
          id: 46_015,
          name: 'John Doe',
          email: 'john.doe@example.com'
        }
      end

      it { is_expected.to have_attributes(hash: Integer, join_link: String) }
    end

    context 'with invalid parameters' do
      subject { response.messages }

      let(:options) do
        {
          id: 46_015,
          email: 'john.doe[at]example.com'
        }
      end

      it { is_expected.to include('Name is required') }
      it { is_expected.to include('Name should contain at least 1 symbol') }
      it { is_expected.to include('Wrong Email format') }
    end
  end
end
