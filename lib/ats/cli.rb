require 'thor'

require 'ats'
require 'ats/cli/threat_grid'

module ATS
  module CLI
    class Application < Thor
      package_name "ATS"

      desc 'threatgrid SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
      subcommand 'threatgrid', ThreatGrid::Application

      desc 'version', 'Display the current version'
      def version
        say ATS::VERSION
      end
    end
  end
end
