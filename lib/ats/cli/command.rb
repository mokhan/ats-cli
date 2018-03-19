module ATS
  module CLI
    class Command < Thor
      class_option :profile, default: :default, required: false

      def self.printable_commands(*args)
        super.map do |x|
          x[0] = x[0].gsub(/^ats/, "ats #{service_name.downcase}")
          x
        end
      end

      protected

      def api
        self.class.constant_name.new(profile: options['profile'])
      end

      def print_json(json)
        say JSON.pretty_generate(json), :green
      end

      def self.constant_name
        Kernel.const_get("ATS::#{service_name}::API")
      end

      def self.service_name
        name.split("::")[2]
      end
    end
  end
end
