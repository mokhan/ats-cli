require 'yaml'
require 'ats/cli/threat_grid/api'

module ATS
  module CLI
    class Threatgrid < Thor
      class_option :profile, default: :default, required: false

      class Users < Thor
        class_option :profile, default: :default, required: false

        desc 'activity <login>', 'activity'
        def activity(login)
          say JSON.pretty_generate(api.users.activity(login))
        end

        private

        def api
          ThreatGrid::API.new(profile: options['profile'])
        end
      end

      desc 'threatgrid SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
      subcommand 'users', Users

      desc 'whoami', 'whoami'
      def whoami
        say JSON.pretty_generate(ThreatGrid::API.new(profile: options['profile']).whoami)
      end
    end
  end
end
