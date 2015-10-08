module Queenbee
  module APIOperations
    module Update
      module ClassMethods
        def save(params = {}, token = nil)
          url = self.url + '/' + params[:uid]
          response, token = Queenbee.request(:put, url, token, params)
          response
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
