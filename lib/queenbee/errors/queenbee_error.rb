module Queenbee
  class QueenbeeError < StandardError
    attr_reader :message
    attr_reader :http_status
    attr_reader :http_body
    attr_reader :json_body

    def initialize(message=nil, http_status=nil, http_body=nil, json_body=nil)
      @message = message
      @http_status = http_status
      @http_body = http_body
      @json_body = json_body
    end

    def to_s
      [
        status_string,
        json_body,
        message
      ].compact.join(" - ")
    end

    def status_string
      http_status.nil? ? "" : "(Status #{http_status})"
    end
  end
end
