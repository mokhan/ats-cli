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

        def search(term)
          api.get("organizations", query: term)
        end

        def show(id)
          api.get("organizations/#{id}")
        end

        def users(id)
          api.get("organizations/#{id}/users")
        end

        def samples(id)
          api.get("organizations/#{id}/samples")
        end

        def user_activity(id)
          api.get("organizations/#{id}/user-activity")
        end

        def entitlements(id)
          api.get("organizations/#{id}/entitlements")
        end
      end
    end
  end
end
