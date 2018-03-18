module ATS
  module CLI
    module AMP4E
      class Application < Thor
        class_option :profile, default: :default, required: false

        desc 'computers SUBCOMMAND ...ARGS', 'interact with the AMP4E API'
        subcommand :computers, ATS::CLI::AMP4E::Computers

        desc 'events SUBCOMMAND ...ARGS', 'interact with the AMP4E API'
        subcommand :events, ATS::CLI::AMP4E::Events

        desc 'groups SUBCOMMAND ...ARGS', 'interact with the AMP4E API'
        subcommand :groups, ATS::CLI::AMP4E::Groups

        desc 'policies SUBCOMMAND ...ARGS', 'interact with the AMP4E API'
        subcommand :policies, ATS::CLI::AMP4E::Policies
      end
    end
  end
end
