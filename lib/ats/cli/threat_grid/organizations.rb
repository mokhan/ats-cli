module ATS
  module CLI
    module ThreatGrid
      class Organizations < Command
        desc 'search <TERM>', 'search'
        def search(term)
          say JSON.pretty_generate(api.organizations.search(term))
        end

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

        desc 'samples <ORG_ID>', 'samples'
        def samples(org_id)
          say JSON.pretty_generate(api.organizations.samples(org_id))
        end

        desc 'user-activity <ORG_ID>', 'user-activity'
        def user_activity(org_id)
          say JSON.pretty_generate(api.organizations.user_activity(org_id))
        end

        desc 'entitlements <ORG_ID>', 'entitlements'
        def entitlements(org_id)
          say JSON.pretty_generate(api.organizations.entitlements(org_id))
        end
      end
    end
  end
end
