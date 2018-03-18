module ATS
  module ThreatGrid
    class Samples
      attr_reader :api

      def initialize(api)
        @api = api
      end

      def search(term)
        api.get("samples/search", checksum: term)
      end
    end
  end
end
