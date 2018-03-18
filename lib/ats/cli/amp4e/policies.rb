module ATS
  module CLI
    module AMP4E
      class Policies < Command
        class_option :profile, default: :default, required: false

        desc 'list', 'list'
        def list
          print_json api.policies.list
        end

        desc 'show <UUID>', 'list'
        def show(id)
          print_json api.policies.show(id)
        end
      end
    end
  end
end
