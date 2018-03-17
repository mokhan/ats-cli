require 'ats/cli/http_api'

module ATS
  module CLI
    module ThreatGrid
      class API
        HEADERS = {
          'Content-Type' => 'application/json',
          'User-Agent' => "ATS/CLI #{ATS::CLI::VERSION}",
        }.freeze

        attr_reader :http, :api_key, :api_host

        def initialize(api: HttpAPI.new(headers: HEADERS), api_key:, api_host:)
          @http = api
          @api_key = api_key
          @api_host = api_host
        end

        def whoami
          http.get(build_uri("session/whoami"), body: default_payload) do |request, response|
            JSON.parse(response.body, symbolize_names: true)[:data]
          end
        end

        private

        def build_uri(relative_url)
          URI.parse("#{api_host}/api/v3/#{relative_url}")
        end

        def default_payload
          { api_key: api_key }
        end
      end
    end
  end
end
