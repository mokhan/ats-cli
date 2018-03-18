module ATS
  module AMP4E
    class Policies
      attr_reader :api

      def initialize(api)
        @api = api
      end

      def list
        api.get("policies")
      end

      def show(id)
        api.get("policies/#{id}")
      end
    end
  end
end
