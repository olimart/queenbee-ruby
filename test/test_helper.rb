require 'queenbee'
require 'test/unit'
require 'shoulda'

class Test::Unit::TestCase
  setup do
  	Queenbee.api_base = 'http://localhost:3024/api'
    Queenbee.token    = '111'
  end

  teardown do
    Queenbee.token = nil
  end
end
