require 'yaml'
require 'ats/cli/threat_grid/api'

module ATS
  module CLI
    class Threatgrid < Thor
      class_option :profile, default: :default, required: false

      desc 'whoami', 'whoami'
      def whoami
        say JSON.pretty_generate(api.whoami)
      end

      private

      def api
        ThreatGrid::API.new(api_key: api_key, api_host: api_host)
      end

      def api_key
        configuration['threatgrid']['api_key']
      end

      def api_host
        configuration['threatgrid']['api_host']
      end

      def configuration
        YAML.load(IO.read('.atsrc'))
      end
    end
  end
end
