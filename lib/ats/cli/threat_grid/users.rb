module ATS
  module CLI
    module ThreatGrid
      class Users < Command
        desc 'show <login>', 'show'
        def show(login)
          print_json api.users.show(login)
        end

        desc 'organization <login>', 'organization'
        def organization(login)
          print_json api.users.organization(login)
        end

        desc 'activity <login>', 'activity'
        def activity(login)
          print_json api.users.activity(login)
        end

        desc 'samples <login>', 'samples'
        def samples(login)
          print_json api.users.samples(login)
        end

        desc 'rate-limit <login>', 'rate-limit'
        def rate_limit(login)
          print_json api.users.rate_limit(login)
        end
      end
    end
  end
end
