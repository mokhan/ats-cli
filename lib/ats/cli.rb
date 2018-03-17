require 'thor'

require 'ats/cli/threatgrid'
require 'ats/cli/version'

module Ats
  module Cli
    class Application < Thor
      desc 'threatgrid SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
      subcommand 'threatgrid', Threatgrid

      desc 'version', 'Display the current version'
      def version
        say Ats::Cli::VERSION
      end
    end
  end
end
