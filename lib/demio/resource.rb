# frozen_string_literal: true

module Demio
  class Resource
    attr_reader :data

    def initialize(data)
      data = {} unless data.is_a?(Hash)
      @data = OpenStruct.new(data.with_indifferent_access)
    end

    private

    def respond_to_missing?(method_sym, _include_private)
      @data.respond_to?(method_sym)
    end

    def method_missing(method_sym, *arguments, &block)
      if @data.respond_to?(method_sym)
        @data.public_send(method_sym)
      else
        super
      end
    end
  end
end
