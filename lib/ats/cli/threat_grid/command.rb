module ATS
  module CLI
    module ThreatGrid
      class Command < Thor
        def self.printable_commands(*args)
          super.map do |x|
            x[0] = x[0].gsub(/^ats/, 'ats threatgrid')
            x
          end
        end
      end
    end
  end
end
