require 'ats/http_api'

module ATS
  module ThreatGrid
    class API
      HEADERS = {
        'Content-Type' => 'application/json',
        'User-Agent' => "ATS/CLI #{ATS::CLI::VERSION}",
      }.freeze

      attr_reader :http, :profile

      def initialize(api: HttpAPI.new(headers: HEADERS), profile: :default)
        @http = api
        @profile = profile.to_s
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

      def configuration
        [
          File.join(Dir.home, ".atsrc"),
          File.expand_path('.atsrc'),
          ENV['ATSRC'],
        ].compact.inject({}) do |memo, file|
          memo.merge!(YAML.load(IO.read(file))) if File.exist?(file)
          memo
        end
      end
    end
  end
end
