module ATS
  module CLI
    module Shiro
      class Versions < Command
        default_command :show

        desc 'show', ''
        def show
          print_json api.version
        end
      end
    end
  end
end
