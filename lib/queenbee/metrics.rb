module Queenbee
  class Metrics < APIResource
    extend Queenbee::APIOperations::Get

    def self.summary(params = {})
      Queenbee::Metrics.get(params, '/metrics/summary')
    end

    def self.all
      Queenbee::Metrics.get('/metrics/all')
    end
  end
end
