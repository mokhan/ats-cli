module ATS
  module CLI
    module ThreatGrid
      class Samples < Command
        desc 'search <SHA256>', 'Search samples'
        def search(term)
          print_json api.samples.search(term)
        end
      end
    end
  end
end
