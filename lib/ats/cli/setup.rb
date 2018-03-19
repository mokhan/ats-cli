module ATS
  module CLI
    class Setup < Command
      default_command :setup

      desc 'setup', 'Initialize the .atsrc file.'
      def setup
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
        yaml = YAML.dump(default_settings)
        say yaml, :yellow
        IO.write(new_file, yaml)
      end

      private

      def default_settings
        {
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
        }
      end
    end
  end
end
