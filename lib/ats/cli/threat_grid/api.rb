require 'ats/cli/http_api'
require 'ats/cli/threat_grid/users'

module ATS
  module CLI
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
          ATS::CLI::ThreatGrid::Users.new(self)
        end

        def get(url)
          http.get(build_uri(url), body: default_payload) do |request, response|
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
          configuration[profile]['threatgrid']['api_key']
        end

        def api_host
          configuration[profile]['threatgrid']['api_host']
        end

        def configuration
          YAML.load(IO.read('.atsrc'))
        end
      end
    end
  end
end
