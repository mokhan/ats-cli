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

      def show(id)
        api.get("computers/#{id}")
      end

      def trajectory(id)
        api.get("computers/#{id}/trajectory")
      end
    end
  end
end
