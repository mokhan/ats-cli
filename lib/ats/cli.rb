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

      desc 'setup', 'Initialize the .atsrc file.'
      def setup(configuration = ATS.configuration)
        say "Current Configuration:", :green
        say JSON.pretty_generate(configuration.configuration), :green

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
            threat_grid: {
              api_host: 'https://example.com',
              api_key: 'secret'
            }
          }
        })
        say yaml, :yellow
        IO.write(new_file, yaml)
      end
    end
  end
end
