module Queenbee
  module APIOperations
    module Delete
      module ClassMethods
        def delete(id, token = nil)
          url = self.url + "/" + id
          response, token = Queenbee.request(:delete, url, token)
          response
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
