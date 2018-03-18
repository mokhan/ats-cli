module ATS
  module CLI
    module ThreatGrid
      class Organizations
        attr_reader :api

        def initialize(api)
          @api = api
        end

        def list
          api.get("organizations")
        end
      end
    end
  end
end
