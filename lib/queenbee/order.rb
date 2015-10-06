module Queenbee
  class Order < APIResource
    include Queenbee::APIOperations::Create
    include Queenbee::APIOperations::Update
  end
end
