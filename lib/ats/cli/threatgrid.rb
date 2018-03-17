require 'yaml'
require 'ats/cli/threat_grid/api'

module ATS
  module CLI
    class Threatgrid < Thor
      class Users < Thor
        class_option :profile, default: :default, required: false

        desc 'whoami', 'whoami'
        def whoami
          say JSON.pretty_generate(api.whoami)
        end

        private

        def api
          ThreatGrid::API.new(profile: options['profile'])
        end

      end

      desc 'threatgrid SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
      subcommand 'users', Users
    end
  end
end
