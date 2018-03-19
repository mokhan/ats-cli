module ATS
  module CLI
    module Shiro
      class Application < Thor
        desc 'tokens SUBCOMMAND ...ARGS', 'interact with the AMP4E API'
        subcommand :tokens, ATS::CLI::Shiro::Tokens
      end
    end
  end
end
