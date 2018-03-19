module ATS
  module CLI
    module ThreatGrid
      class Whoami < Command
        default_command :whoami

        desc 'whoami', 'whoami'
        def whoami
          print_json api.whoami
        end
      end
    end
  end
end
