
# frozen_string_literal: true

module Demio
  class Client
    module Ping
      def ping
        get('/ping')
      end
    end
  end
end
