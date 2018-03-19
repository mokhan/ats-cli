module ATS
  module CLI
    module AMP4E
      class Computers < Command
        desc 'list', 'list'
        def list
          print_json api.computers.list
        end

        desc 'show <UUID>', 'list'
        def show(id)
          print_json api.computers.show(id)
        end

        desc 'trajectory <UUID>', 'list'
        def trajectory(id)
          print_json api.computers.trajectory(id)
        end

        desc 'user-activity <query>', 'list'
        def user_activity(query)
          print_json api.computers.user_activity(query)
        end

        desc 'user-trajectory <UUID> <query>', 'list'
        def user_trajectory(id, query)
          print_json api.computers.user_trajectory(id, query)
        end

        desc 'activity <query>', 'list'
        def activity(query)
          print_json api.computers.activity(query)
        end
      end
    end
  end
end
