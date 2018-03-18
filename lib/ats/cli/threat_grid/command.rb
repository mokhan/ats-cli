module ATS
  module CLI
    module ThreatGrid
      class Command < Thor
        class_option :profile, default: :default, required: false

        def self.printable_commands(*args)
          super.map do |x|
            x[0] = x[0].gsub(/^ats/, 'ats threatgrid')
            x
          end
        end

        protected

        def api
          ATS::ThreatGrid::API.new(profile: options['profile'])
        end
      end
    end
  end
end
