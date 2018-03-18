module ATS
  module AMP4E
    class API
      HEADERS = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'User-Agent' => "RubyGems/ATS #{ATS::VERSION}",
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

      def computers
        ATS::AMP4E::Computers.new(self)
      end

      def events
        ATS::AMP4E::Events.new(self)
      end

      def groups
        ATS::AMP4E::Groups.new(self)
      end

      def get(url, params: {}, version: 1)
        http.get(build_uri(url, version: version), headers: headers, body: params) do |request, response|
          JSON.parse(response.body, symbolize_names: true)
        end
      end

      private

      def build_uri(relative_url, version:)
        URI.parse("#{api_host}/v#{version}/#{relative_url}")
      end

      def client_id
        configuration[profile]['amp4e']['client_id']
      end

      def client_secret
        configuration[profile]['amp4e']['client_secret']
      end

      def api_host
        configuration[profile]['amp4e']['api_host']
      end

      def headers
        { AUTHORIZATION: "Basic #{Base64.strict_encode64("#{client_id}:#{client_secret}")}" }
      end
    end
  end
end
