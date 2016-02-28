module Queenbee
  module APIOperations
    module Get
      def get(params = {}, token = nil, url)
        response, token = Queenbee.request(:get, url, token, params)
        response
      end
    end
  end
end
