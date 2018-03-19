module ATS
  class Configuration
    attr_accessor :logger, :config_files, :configuration, :debug

    def initialize
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::DEBUG
      @debug = false
      @config_files = [
        File.join(Dir.home, ".atsrc"),
        File.expand_path('.atsrc'),
        ENV['ATSRC']
      ].compact
    end

    def [](key)
      @configuration ||= load_configuration
      @configuration[key.to_sym]
    end

    def load_configuration(files = config_files)
      files.inject({}) do |memo, file|
        logger.debug("Loading... #{file}") if debug
        memo.merge!(YAML.load(IO.read(file))) if File.exist?(file)
        memo
      end
    end
  end
end
