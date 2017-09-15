require File.expand_path("../../test_helper", __FILE__)

module Queenbee
  class EventTest < Test::Unit::TestCase
    setup do
      @valid_params = {
        date: "2014-07-01 14:50:28",
        status: "confirmed",
        message: "From the API",
        metadata: {color: "pink", "sport": "basket-ball", "age": 25, "fruit": "banana"}
      }
    end

    should "create should return status 201" do
      response = Queenbee::Event.create(@valid_params)
      assert_equal "201", response.code
    end

    should "raise Queenbee::AuthenticationError if no token provided" do
      Queenbee.token = nil
      assert_raises(Queenbee::AuthenticationError) { Queenbee::Event.create }
    end

    should "raise Queenbee::InvalidRequestError if not enough parameters" do
      begin
      rescue JSON::ParserError
        assert_raises(Queenbee::InvalidRequestError) { Queenbee::Event.create }
      end
    end
  end
end
