require 'yaml'
require 'ats/cli/threat_grid/api'

module ATS
  module CLI
    class Threatgrid < Thor
      class_option :profile, default: :default, required: false

      class Users < Thor
        class_option :profile, default: :default, required: false

        desc 'activity <login>', 'activity'
        def activity(login)
          say JSON.pretty_generate(api.users.activity(login))
        end

        desc 'samples <login>', 'samples'
        def samples(login)
          say JSON.pretty_generate(api.users.samples(login))
        end

        desc 'rate-limit <login>', 'rate-limit'
        def rate_limit(login)
          say JSON.pretty_generate(api.users.rate_limit(login))
        end

        private

        def api
          ThreatGrid::API.new(profile: options['profile'])
        end
      end

      class Organizations < Thor
        class_option :profile, default: :default, required: false

        desc 'list', 'list'
        def list
          say JSON.pretty_generate(api.organizations.list)
        end

        desc 'show <ORG_ID>', 'show'
        def show(org_id)
          say JSON.pretty_generate(api.organizations.show(org_id))
        end

        desc 'users <ORG_ID>', 'users'
        def users(org_id)
          say JSON.pretty_generate(api.organizations.users(org_id))
        end

        private

        def api
          ThreatGrid::API.new(profile: options['profile'])
        end
      end

      desc 'threatgrid SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
      subcommand 'users', Users

      desc 'threatgrid SUBCOMMAND ...ARGS', 'interact with the Threat Grid API'
      subcommand 'organizations', Organizations

      desc 'whoami', 'whoami'
      def whoami
        say JSON.pretty_generate(ThreatGrid::API.new(profile: options['profile']).whoami)
      end
    end
  end
end
