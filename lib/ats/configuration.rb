module ATS
  class Configuration
    attr_accessor :logger, :config_files, :debug

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
      @hash ||= load_configuration
      @hash[key.to_sym]
    end

    private

    def load_configuration(files = config_files)
      files.inject({}) do |memo, file|
        logger.debug("Loading... #{file}") if debug
        memo.merge!(YAML.load(IO.read(file))) if File.exist?(file)
        memo
      end
    end
  end
end
