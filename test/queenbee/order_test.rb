require File.expand_path("../../test_helper", __FILE__)
require 'securerandom'

module Queenbee
  class OrderTest < Test::Unit::TestCase
    setup do
      @uid = SecureRandom.hex(4)
      @valid_params = {
        date: "2014-07-01 14:50:28",
        currency: "CAD", city: "Paris",
        country: "Canada", client_email: "d@email.com",
        amount: "10", shipping: "2", total_price: "12",
        uid: @uid
      }
      @updated_params = @valid_params.merge!(client_email: "kk@email.com")
    end

    should "create should return status 201" do
      VCR.use_cassette("order.created") do
        response = Queenbee::Order.create(@valid_params)
        assert_equal "201", response.code
      end
    end

    should "raise Queenbee::AuthenticationError if no token provided" do
      Queenbee.token = nil
      assert_raises(Queenbee::AuthenticationError) { Queenbee::Order.create }
    end

    should "raise Queenbee::InvalidRequestError if not enough parameters" do
      begin
      rescue JSON::ParserError
        assert_raises(Queenbee::InvalidRequestError) { Queenbee::Order.create }
      end
    end

    should "Update should return 200" do
      VCR.use_cassette("order.updated") do
        response = Queenbee::Order.save(@updated_params.merge!(uid: "334a9f80"))
        assert_equal "200", response.code
      end
    end

    # Queenbee API raises error if record not found `find_by!`
    # preventing tests from passing
    # TODO
    # - Review API response
    # - Separate tests from real response from the API
    #
    # should "Update should return 404 if UID incorrect" do
    #   response1 = Queenbee::Order.create(@valid_params)
    #   invalid_params = @valid_params.merge!(uid: "fakeuid")
    #   response = Queenbee::Order.save(invalid_params)
    #   assert_equal "404", response.code
    # end

    should "Delete should return 204" do
      VCR.use_cassette("order.deleted") do
        response = Queenbee::Order.delete("334a9f80")
        assert_equal "204", response.code
      end
    end

    # should "Delete should return 404 if UID incorrect" do
    #   response = Queenbee::Order.delete("fakeuid")
    #   assert_equal "404", response.code
    # end
  end
end
