module ATS
  module CLI
    module Shiro
      class Tokens < Command
        desc 'introspect <TOKEN>', 'introspection endpoint'
        def introspect(token)
          print_json api.tokens.introspect(token)
        end
      end
    end
  end
end
