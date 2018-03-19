module ATS
  module CLI
    module AMP4E
      class Groups < Command
        desc 'list', 'list'
        def list
          print_json api.groups.list
        end

        desc 'show <UUID>', 'list'
        def show(id)
          print_json api.groups.show(id)
        end
      end
    end
  end
end
