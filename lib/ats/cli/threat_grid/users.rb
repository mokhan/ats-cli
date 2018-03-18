module ATS
  module CLI
    module ThreatGrid
      class Users < Command
        desc 'show <login>', 'show'
        def show(login)
          say JSON.pretty_generate(api.users.show(login))
        end

        desc 'organization <login>', 'organization'
        def organization(login)
          say JSON.pretty_generate(api.users.organization(login))
        end

        desc 'activity <login>', 'activity'
        def activity(login)
          say JSON.pretty_generate(api.users.activity(login))
        end

        desc 'samples <login>', 'samples'
        def samples(login)
          say JSON.pretty_generate(api.users.samples(login))
        end

        desc 'rate-limit <login>', 'rate-limit'
        def rate_limit(login)
          say JSON.pretty_generate(api.users.rate_limit(login))
        end
      end
    end
  end
end
