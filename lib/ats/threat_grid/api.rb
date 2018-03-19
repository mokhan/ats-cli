require 'ats/http_api'

module ATS
  module ThreatGrid
    class API
      HEADERS = {
        'Content-Type' => 'application/json',
        'User-Agent' => "RubyGems/ATS #{ATS::VERSION}",
      }.freeze

      attr_reader :http, :profile, :configuration

      def initialize(
        api: HttpAPI.new(headers: HEADERS),
        profile: :default,
        configuration: ATS.configuration
      )
        @http = api
        @profile = profile.to_sym
        @configuration = configuration
      end

      def whoami
        get("session/whoami")
      end

      def users
        ATS::ThreatGrid::Users.new(self)
      end

      def organizations
        ATS::ThreatGrid::Organizations.new(self)
      end

      def samples
        ATS::ThreatGrid::Samples.new(self)
      end

      def search
        ATS::ThreatGrid::Search.new(self)
      end

      def get(url, params: {}, version: 3)
        http.get(build_uri(url, version: version), body: default_payload.merge(params)) do |request, response|
          JSON.parse(response.body, symbolize_names: true)[:data]
        end
      end

      private

      def default_payload
        { api_key: api_key }
      end

      def build_uri(relative_url, version:)
        URI::Generic.build(host: host, port: port, scheme: scheme, path: "/api/v#{version}/#{relative_url}")
      end

      def api_key
        configuration[profile][:threat_grid][:api_key]
      end

      def host
        configuration[profile][:threat_grid][:host]
      end

      def scheme
        configuration[profile][:threat_grid][:scheme]
      end

      def port
        configuration[profile][:threat_grid][:port]
      end
    end
  end
end
