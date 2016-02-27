require 'queenbee'
require 'test/unit'
require 'shoulda'

class Test::Unit::TestCase
  setup do
  	Queenbee.api_base = 'http://localhost:3019/api'
    Queenbee.token    = '37026aced6440bbb9935d4b9afe4b993'
  end

  teardown do
    Queenbee.token = nil
  end
end
