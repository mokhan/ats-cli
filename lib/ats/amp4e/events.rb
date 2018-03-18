module ATS
  module AMP4E
    class Events
      attr_reader :api

      def initialize(api)
        @api = api
      end

      def list
        api.get("events")
      end

      def types
        api.get("event_types")
      end
    end
  end
end
