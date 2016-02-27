module Queenbee
  class Metrics < APIResource
    extend Queenbee::APIOperations::Get

    def self.summary(params = {})
      Queenbee::Metrics.get(params,'37026aced6440bbb9935d4b9afe4b993','/metrics/summary')
    end

  end
end
