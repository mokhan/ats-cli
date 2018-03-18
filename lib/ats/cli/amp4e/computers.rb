module ATS
  module CLI
    module AMP4E
      class Computers < Command
        class_option :profile, default: :default, required: false

        desc 'list', 'list'
        def list
          print_json api.computers.list
        end
      end
    end
  end
end
