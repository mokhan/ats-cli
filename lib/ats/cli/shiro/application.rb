module ATS
  module CLI
    module Shiro
      class Application < Thor
        desc 'tokens SUBCOMMAND ...ARGS', 'interact with the Auth API'
        subcommand :tokens, ATS::CLI::Shiro::Tokens

        desc 'version SUBCOMMAND ...ARGS', 'interact with the Auth API'
        subcommand :version, ATS::CLI::Shiro::Versions
      end
    end
  end
end
