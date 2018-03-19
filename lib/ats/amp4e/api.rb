module ATS
  module AMP4E
    class API
      HEADERS = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'User-Agent' => "RubyGems/ATS #{ATS::VERSION}",
      }.freeze

      attr_reader :http, :port, :host, :scheme, :client_id, :client_secret

      def initialize(configuration:, debug: false)
        @http = HttpAPI.new(headers: HEADERS, debug: debug)
        @configuration = configuration
        @port = configuration[:port]
        @scheme = configuration[:scheme]
        @host = configuration[:host]
        @client_id = configuration[:client_id]
        @client_secret = configuration[:client_secret]
      end

      def computers
        ATS::AMP4E::Computers.new(self)
      end

      def events
        ATS::AMP4E::Events.new(self)
      end

      def groups
        ATS::AMP4E::Groups.new(self)
      end

      def policies
        ATS::AMP4E::Policies.new(self)
      end

      def get(url, params: {}, version: 1)
        http.get(build_uri(url, version: version), headers: headers, body: params) do |request, response|
          JSON.parse(response.body, symbolize_names: true)
        end
      end

      private

      def build_uri(relative_url, version:)
        URI::Generic.build(host: host, port: port, scheme: scheme, path: "/v#{version}/#{relative_url}")
      end

      def headers
        { AUTHORIZATION: "Basic #{Base64.strict_encode64("#{client_id}:#{client_secret}")}" }
      end
    end
  end
end
