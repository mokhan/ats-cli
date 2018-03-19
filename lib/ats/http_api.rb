module ATS
  class HttpAPI
    def initialize(headers: {})
      @default_headers = headers
    end

    def execute(uri, request)
      http_for(uri).request(request)
    end

    def get(uri, headers: {}, body: {})
      request = get_for(uri, headers: headers, body: body)
      response = execute(uri, request)
      if block_given?
        yield request, response
      else
        response
      end
    end

    def post(uri, headers: {}, body: {})
      request = post_for(uri, headers: headers, body: body)
      response = execute(uri, request)
      if block_given?
        yield request, response
      else
        response
      end
    end

    def put(uri, headers: {}, body: {})
      request = put_for(uri, headers: headers, body: body)
      response = execute(uri, request)
      if block_given?
        yield request, response
      else
        response
      end
    end

    private

    def http_for(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.read_timeout = 30
      http.use_ssl = uri.scheme == "https"
      http.set_debug_output(ATS.logger)
      http
    end

    def post_for(uri, headers: {}, body: {})
      Net::HTTP::Post.new(uri.path, @default_headers.merge(headers)).tap do |x|
        x.body = JSON.generate(body)
      end
    end

    def put_for(uri, headers: {}, body: {})
      Net::HTTP::Put.new(uri.path, @default_headers.merge(headers)).tap do |x|
        x.body = JSON.generate(body)
      end
    end

    def get_for(uri, headers: {}, body: {})
      Net::HTTP::Get.new(uri.path, @default_headers.merge(headers)).tap do |x|
        x.body = JSON.generate(body)
      end
    end
  end
end
