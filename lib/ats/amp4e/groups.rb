module ATS
  module AMP4E
    class Groups
      attr_reader :api

      def initialize(api)
        @api = api
      end

      def list
        api.get("groups")
      end
    end
  end
end
