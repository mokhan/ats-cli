require 'ats/cli/threat_grid/organizations'
require 'ats/cli/threat_grid/users'

module ATS
  module CLI
    class ThreatGrid < Thor
      class_option :profile, default: :default, required: false

      desc 'users SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
      subcommand :users, Users

      desc 'organizations SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
      subcommand :organizations, Organizations

      desc 'whoami', 'whoami'
      def whoami
        say JSON.pretty_generate(ATS::ThreatGrid::API.new(profile: options['profile']).whoami)
      end
    end
  end
end
