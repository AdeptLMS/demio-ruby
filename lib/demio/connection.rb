# frozen_string_literal: true

module Demio
  module Connection
    def get(path, options = {})
      request :get, path, options
    end

    def post(path, options = {})
      request :post, path, options
    end

    def put(path, options = {})
      request :put, path, options
    end

    def delete(path, options = {})
      request :delete, path, options
    end

    private

    def request(http_method, path, options)
      response = self.class.send(http_method, path, body: options)
      data = response.parsed_response
      parse_data(data)
    end

    def parse_data(data)
      case data
      when Hash  then Resource.new(data)
      when Array then ResourceCollection.new(data)
      when nil   then nil
      else data
      end
    end
  end
end
