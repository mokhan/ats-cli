module ATS
  module CLI
    module ThreatGrid
      class Application < Thor
        class_option :profile, default: :default, required: false

        desc 'users SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
        subcommand :users, ATS::CLI::ThreatGrid::Users

        desc 'organizations SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
        subcommand :organizations, ATS::CLI::ThreatGrid::Organizations

        desc 'whoami', 'whoami'
        def whoami
          say JSON.pretty_generate(ATS::ThreatGrid::API.new(profile: options['profile']).whoami)
        end
      end
    end
  end
end
