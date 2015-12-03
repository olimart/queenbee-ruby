module Queenbee
  module APIOperations
    module Delete
      module ClassMethods
        def delete(params = {}, token = nil)
          url = self.url + '/' + params[:uid]
          response, token = Queenbee.request(:delete, url, token, params)
          response
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
