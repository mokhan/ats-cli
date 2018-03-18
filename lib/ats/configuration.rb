module ATS
  class Configuration
    attr_accessor :logger, :config_files

    def initialize
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::DEBUG
      @config_files = [
        File.join(Dir.home, ".atsrc"),
        File.expand_path('.atsrc'),
        ENV['ATSRC']
      ].compact

      @configuration = load_configuration
    end

    def [](key)
      @configuration[key]
    end

    def load_configuration(files = config_files)
      files.inject({}) do |memo, file|
        logger.debug("Loading... #{file}")
        memo.merge!(YAML.load(IO.read(file))) if File.exist?(file)
        memo
      end
    end
  end
end
