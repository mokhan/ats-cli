module Ats
  module Cli
    class Threatgrid < Thor
      class_option :profile, default: :default, required: false

      desc 'whoami', 'whoami'
      def whoami
        say Threatgrid::API.new(configuration).whoami
      end
    end
  end
end
