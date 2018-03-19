require 'ats'
require 'thor'
require 'ats/cli/command'
require 'ats/cli/setup'
require 'ats/cli/threat_grid/organizations'
require 'ats/cli/threat_grid/samples'
require 'ats/cli/threat_grid/search'
require 'ats/cli/threat_grid/users'
require 'ats/cli/threat_grid/whoami'
require 'ats/cli/threat_grid/application'
require 'ats/cli/amp4e/computers'
require 'ats/cli/amp4e/events'
require 'ats/cli/amp4e/groups'
require 'ats/cli/amp4e/policies'
require 'ats/cli/amp4e/application'
require 'ats/cli/shiro/tokens'
require 'ats/cli/shiro/application'

module ATS
  module CLI
    class Application < Thor
      package_name "ATS"

      desc 'threatgrid SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
      subcommand 'threatgrid', ThreatGrid::Application

      desc 'amp4e SUBCOMMAND ...ARGS', 'interact with the AMP for Endpoints API'
      subcommand 'amp4e', AMP4E::Application

      desc 'shiro SUBCOMMAND ...ARGS', 'interact with the AMP for Endpoints API'
      subcommand 'shiro', Shiro::Application

      desc 'setup', 'setup'
      subcommand :setup, ATS::CLI::Setup

      desc 'version', 'Display the current version'
      def version
        say ATS::VERSION
      end
    end
  end
end
