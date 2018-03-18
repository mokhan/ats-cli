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

      def show(id)
        api.get("groups/#{id}")
      end
    end
  end
end
