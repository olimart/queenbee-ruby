# Queenbee Ruby bindings
require "rest_client"
require "json"
require "net/http"
require "uri"

# Version
require "queenbee/version"

# API operations
require "queenbee/api_operations/create"

# Resources
require "queenbee/queenbee_object"
require "queenbee/api_resource"
require "queenbee/order"

# Errors
require "queenbee/errors/queenbee_error"
require "queenbee/errors/api_error"
require "queenbee/errors/api_connection_error"
require "queenbee/errors/invalid_request_error"
require "queenbee/errors/authentication_error"

module Queenbee
    @api_base = "http://localhost:3000/api"

    class << self
      attr_accessor :token, :api_base, :verify_ssl_certs, :api_version
    end

    # self.token = config.queenbee_token if config

    def self.api_url(url="")
      @api_base + url
    end

    def self.request(method, url, token, params={}, headers={})
      unless token ||= @token
        raise AuthenticationError.new("No token provided")
      end

      url = api_url(url)

      begin
        # response = execute_request(request_opts)
        uri = URI(url)
        request = Net::HTTP::Post.new(uri)

        request["User-Agent"] = "Queenbee gem"
        request["Authorization"] = "Token token=\"#{token}\""
        request["Content-Type"] = "application/json"

        request.body = params.to_json

        response = Net::HTTP.start(uri.hostname, uri.port) {|http|
          http.request(request)
        }

        # since http.request doesn't throw any exceptions
        handle_api_error(response.code, response.body)

        puts response.code
      rescue SocketError => e
          handle_connection_error(e)
      rescue NoMethodError => e
          handle_connection_error(e)
      rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
          Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
          handle_connection_error(e)
      end

      [response, token]
    end

    def self.handle_connection_error(e)
      case e
        when SocketError
          message = "Unexpected error communicating when trying to connect to Queenbee. "

        when NoMethodError
          message = "Unexpected HTTP response code"

        else
          message = "Unexpected error communicating with Queenbee. "
      end

      raise APIConnectionError.new(message + "\n\n(Network error: #{e.message})")
    end

    def self.handle_api_error(rcode, rbody)
      begin
        error_obj = JSON.parse(rbody)
      rescue JSON::ParserError
        raise general_api_error(rcode, rbody)
      end

      case rcode
        when 400, 404
          raise invalid_request_error error, rcode, rbody, error_obj
        when 401
          raise authentication_error error, rcode, rbody, error_obj
        else
          # raise api_error error, rcode, rbody, error_obj
      end

    end

    def self.invalid_request_error(error, rcode, rbody, error_obj)
      InvalidRequestError.new(error[:message], error[:param], rcode,
                              rbody, error_obj)
    end

    def self.authentication_error(error, rcode, rbody, error_obj)
      AuthenticationError.new(error[:message], rcode, rbody, error_obj)
    end

    def self.api_error(error, rcode, rbody, error_obj)
      APIError.new(error[:message], rcode, rbody, error_obj)
    end

    def self.general_api_error(rcode, rbody)
      APIError.new("Invalid response object from API: #{rbody.inspect} " +
                       "(HTTP response code was #{rcode})", rcode, rbody)
    end
end
