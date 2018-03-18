module ATS
  module CLI
    module ThreatGrid
      class Users
        attr_reader :api

        def initialize(api)
          @api = api
        end

        def activity(login)
          api.get("users/#{login}/activity")
        end

        def samples(login)
          api.get("users/#{login}/samples")
        end

        def rate_limit(login)
          api.get("users/#{login}/rate-limit")
        end
      end
    end
  end
end
