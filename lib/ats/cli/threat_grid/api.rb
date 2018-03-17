module ATS
  module CLI
    module ThreatGrid
      class API
        HEADERS = {
          'Content-Type' => 'application/json',
          'User-Agent' => "ATS/CLI #{ATS::CLI::VERSION}",
        }.freeze

        def initialize(api: HttpApi.new(headers: HEADERS), api_key:, api_host:)
          @http = api
          @api_key = api_key
          @api_host = api_host
        end
      end
    end
  end
end
