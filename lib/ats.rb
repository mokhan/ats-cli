require 'base64'
require 'json'
require 'logger'
require 'net/http'
require 'yaml'

require 'ats/configuration'
require 'ats/http_api'
require 'ats/version'

require 'ats/amp4e/api'
require 'ats/amp4e/computers'
require 'ats/amp4e/events'
require 'ats/amp4e/groups'
require 'ats/amp4e/policies'
require 'ats/threat_grid/api'
require 'ats/threat_grid/organizations'
require 'ats/threat_grid/samples'
require 'ats/threat_grid/search'
require 'ats/threat_grid/users'
require 'ats/shiro/api'
require 'ats/shiro/tokens'

module ATS
  class << self
    def logger
      configuration.logger
    end

    def configure
      yield configuration
      configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
