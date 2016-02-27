module Queenbee
  module APIOperations
    module Get
      #module ClassMethods
        def get(params = {}, token = nil,url)
          response, token = Queenbee.request(:get, url, token, params)
          response
        end
      #end

      # def self.included(base)
      #   base.extend(ClassMethods)
      # end
    end
  end
end
