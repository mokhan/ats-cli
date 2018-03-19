module ATS
  module Shiro
    class Tokens
      attr_reader :api

      def initialize(api)
        @api = api
      end

      def introspect(token)
        api.post("tokens/introspect", params: { token: token })
      end
    end
  end
end
