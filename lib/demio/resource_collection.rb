# frozen_string_literal: true

module Demio
  class ResourceCollection < Resource
    include Enumerable

    def initialize(data)
      collection = data.blank? ? [] : Array(data).map { |item| Resource.new(item) }

      @data = OpenStruct.new(collection: collection)
    end

    def each
      collection.each { |item| yield item }
    end
  end
end
