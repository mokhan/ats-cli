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

        def show(id)
          api.get("organizations/#{id}")
        end

        def users(id)
          api.get("organizations/#{id}/users")
        end
      end
    end
  end
end
