module Queenbee
  class Order < APIResource
    include Queenbee::APIOperations::Create
    include Queenbee::APIOperations::Update
    include Queenbee::APIOperations::Delete
  end
end
