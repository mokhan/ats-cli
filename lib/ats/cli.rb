require 'thor'

require 'ats'
require 'ats/cli/threat_grid'

module ATS
  module CLI
    class Application < Thor
      desc 'threatgrid SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
      subcommand 'threatgrid', ThreatGrid

      desc 'version', 'Display the current version'
      def version
        say ATS::CLI::VERSION
      end
    end
  end
end
