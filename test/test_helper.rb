require "queenbee"
require "test/unit"
require "shoulda"

class Test::Unit::TestCase

  setup do
    Queenbee.token = "e5b8dde5955381f73a24982fb3ce3c7f"
  end

  teardown do
    Queenbee.token = nil
  end
end
