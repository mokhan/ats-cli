require 'ats'
require 'thor'
require 'ats/cli/command'
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

module ATS
  module CLI
    class Application < Thor
      package_name "ATS"

      desc 'threatgrid SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
      subcommand 'threatgrid', ThreatGrid::Application

      desc 'amp4e SUBCOMMAND ...ARGS', 'interact with the AMP for Endpoints API'
      subcommand 'amp4e', AMP4E::Application

      desc 'version', 'Display the current version'
      def version
        say ATS::VERSION
      end

      desc 'setup', 'Initialize the .atsrc file.'
      def setup(configuration = ATS.configuration)
        say "Current Configuration:", :green
        say JSON.pretty_generate(configuration.to_h), :green

        configuration.config_files.each do |file|
          if File.exist?(file)
            say "Found #{file}. Nothing to do. Good bye!", :green
            exit 0
          end
        end

        say "Configuration file not found."
        new_file = configuration.config_files.first
        say "New file created at #{new_file}."
        yaml = YAML.dump({
          default: {
            amp4e: {
              client_id: '',
              client_secret: '',
              host: 'api.amp.cisco.com',
              port: 443,
              scheme: 'https',
            },
            threatgrid: {
              api_key: '',
              host: 'panacea.threatgrid.com',
              port: 443,
              scheme: 'https',
            },
          }
        })
        say yaml, :yellow
        IO.write(new_file, yaml)
      end
    end
  end
end
