module ATS
  module CLI
    module AMP4E
      class Application < Thor
        class_option :profile, default: :default, required: false

        desc 'computers SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
        subcommand :computers, ATS::CLI::AMP4E::Computers
      end
    end
  end
end
