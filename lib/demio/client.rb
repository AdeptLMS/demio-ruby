# frozen_string_literal: true

require 'demio/connection'

require 'demio/client/ping'
require 'demio/client/events'

module Demio
  class Client
    include HTTParty
    include Demio::Connection
    include Demio::Client::Ping
    include Demio::Client::Events

    base_uri 'https://my.demio.com/api/v1'
    format :json

    def initialize(api_key: nil, api_secret: nil)
      api_key ||= ENV['DEMIO_API_KEY']
      api_secret ||= ENV['DEMIO_API_SECRET']
      self.class.default_options.merge!(
        headers: { 'Api-Key' => api_key, 'Api-Secret' => api_secret }
      )
    end
  end
end
