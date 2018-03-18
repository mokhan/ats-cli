module ATS
  module ThreatGrid
    class Entitlements
      attr_reader :api

      def initialize(api)
        @api = api
      end

      def list
        api.get("entitlements")
      end
    end
  end
end
