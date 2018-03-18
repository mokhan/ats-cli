module ATS
  module AMP4E
    class Computers
      attr_reader :api

      def initialize(api)
        @api = api
      end

      def list
        api.get("computers")
      end
    end
  end
end
