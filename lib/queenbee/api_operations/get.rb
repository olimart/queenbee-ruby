module Queenbee
  module APIOperations
    module Get
      module ClassMethods
        def get(params = {}, token = nil)
          response, token = Queenbee.request(:get, self.url, token, params)
          response
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
