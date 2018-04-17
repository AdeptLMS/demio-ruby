
# frozen_string_literal: true

module Demio
  class Client
    module Events
      def events
        get('/events')
      end

      def event(id)
        get("/event/#{id}")
      end

      def event_date(event_id:, date_id:)
        get("/event/#{event_id}/date/#{date_id}")
      end

      def register(options)
        put('/event/register', options.to_json)
      end
    end
  end
end
