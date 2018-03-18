module ATS
  module CLI
    module AMP4E
      class Command < Thor
        class_option :profile, default: :default, required: false

        def self.printable_commands(*args)
          super.map do |x|
            x[0] = x[0].gsub(/^ats/, 'ats amp4e')
            x
          end
        end

        protected

        def api
          ATS::AMP4E::API.new(profile: options['profile'])
        end

        def print_json(json)
          say JSON.pretty_generate(json), :green
        end
      end
    end
  end
end
