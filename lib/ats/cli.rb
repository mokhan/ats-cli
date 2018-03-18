require 'json'
require 'logger'
require 'thor'
require 'yaml'

require 'ats/cli/threat_grid'
require 'ats/cli/version'
require 'ats/threat_grid'

module ATS
  module CLI
    def self.logger
      @logger ||= Logger.new(STDOUT)
    end

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
