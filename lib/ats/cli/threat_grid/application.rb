module ATS
  module CLI
    module ThreatGrid
      class Application < Thor
        desc 'users SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
        subcommand :users, ATS::CLI::ThreatGrid::Users

        desc 'organizations SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
        subcommand :organizations, ATS::CLI::ThreatGrid::Organizations

        desc 'samples SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
        subcommand :samples, ATS::CLI::ThreatGrid::Samples

        desc 'search SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
        subcommand :search, ATS::CLI::ThreatGrid::Search

        desc 'whoami', 'interact with the Threat Grid API'
        subcommand :whoami, ATS::CLI::ThreatGrid::Whoami
      end
    end
  end
end
