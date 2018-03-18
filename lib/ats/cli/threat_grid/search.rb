module ATS
  module CLI
    module ThreatGrid
      class Search < Command
        desc 'urls <URL>', 'Search urls'
        def urls(url)
          print_json api.search.urls(url)
        end
      end
    end
  end
end
