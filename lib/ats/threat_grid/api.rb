require 'ats/http_api'

module ATS
  module ThreatGrid
    class API
      HEADERS = {
        'Content-Type' => 'application/json',
        'User-Agent' => "ATS/CLI #{ATS::VERSION}",
      }.freeze

      attr_reader :http, :profile, :configuration

      def initialize(
        api: HttpAPI.new(headers: HEADERS),
        profile: :default,
        configuration: ATS.configuration
      )
        @http = api
        @profile = profile.to_s
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

      def entitlements
        ATS::ThreatGrid::Entitlements.new(self)
      end

      def get(url, params = {})
        http.get(build_uri(url), body: default_payload.merge(params)) do |request, response|
          JSON.parse(response.body, symbolize_names: true)[:data]
        end
      end

      private

      def default_payload
        { api_key: api_key }
      end

      def build_uri(relative_url)
        URI.parse("#{api_host}/api/v3/#{relative_url}")
      end

      def api_key
        configuration[profile]['threat_grid']['api_key']
      end

      def api_host
        configuration[profile]['threat_grid']['api_host']
      end
    end
  end
end
