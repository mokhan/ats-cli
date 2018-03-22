module ATS
  module Shiro
    class API
      HEADERS = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'User-Agent' => "RubyGems/ATS #{ATS::VERSION}",
      }.freeze

      attr_reader :http, :port, :host, :scheme, :bearer_token

      def initialize(configuration:, debug: false)
        @http = HttpAPI.new(headers: HEADERS, debug: debug)
        @configuration = configuration
        @port = configuration[:port]
        @scheme = configuration[:scheme]
        @host = configuration[:host]
        @bearer_token = configuration[:bearer_token]
      end

      def tokens
        ATS::Shiro::Tokens.new(self)
      end

      def version
        get("version")
      end

      def get(url, params: {}, version: 1)
        http.get(build_uri(url, version: version), headers: headers, body: params) do |request, response|
          JSON.parse(response.body, symbolize_names: true)
        end
      end

      def post(url, params: {}, version: 1)
        http.post(build_uri(url, version: version), headers: headers, body: params) do |request, response|
          JSON.parse(response.body, symbolize_names: true)
        end
      end

      private

      def build_uri(relative_url, version:)
        URI::Generic.build(host: host, port: port, scheme: scheme, path: "/api/v#{version}/#{relative_url}")
      end

      def headers
        { AUTHORIZATION: "Bearer #{bearer_token}" }
      end
    end
  end
end
