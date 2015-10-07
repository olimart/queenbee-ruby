module Queenbee
  module APIOperations
    module Update
      module ClassMethods
        def save(params={}, token=nil)
          # values = self.class.serialize_params(self).merge(params)
          #
          # if values.length > 0
          #   values.delete(:id)

            #response, opts = request(:post, url, values)
             url = self.url + '/' + params[:uid]
            response, token = Queenbee.request(:put,url, token, params)
            # refresh_from(response, opts)
            response
          #end

          # response, token = Queenbee.request(:post, self.url, token, params)
          # response
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
