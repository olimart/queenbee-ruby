require "queenbee"
require "test/unit"
require "shoulda"

class Test::Unit::TestCase

  setup do
    Queenbee.token = "111"
    Queenbee.api_base = "http://localhost:3010/api"
  end

  teardown do
    Queenbee.token = nil
  end
end
