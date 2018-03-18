module ATS
  module ThreatGrid
    class Search
      attr_reader :api

      def initialize(api)
        @api = api
      end

      def urls(url)
        api.get("search/urls", params: { url: url }, version: 2)
      end
    end
  end
end
