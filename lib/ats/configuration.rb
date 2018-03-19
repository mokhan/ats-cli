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
      hash[key.to_sym]
    end

    def to_h
      hash.dup
    end

    private

    def hash
      @hash ||= load_configuration
    end

    def load_configuration(files = config_files)
      files.inject({}) do |memo, file|
        logger.debug("Searching for #{file}...") if debug
        memo.merge!(YAML.load(IO.read(file))) if File.exist?(file)
        memo
      end
    end
  end
end
