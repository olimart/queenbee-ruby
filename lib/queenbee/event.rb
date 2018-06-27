module Queenbee
  class Event < APIResource
    extend Queenbee::APIOperations::Get
    include Queenbee::APIOperations::Create

    def self.all(opts = {})
      Queenbee::Metrics.get("/events?page=#{opts[:page] || 1}")
    end
  end
end
