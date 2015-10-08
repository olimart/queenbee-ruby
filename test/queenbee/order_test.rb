require File.expand_path("../../test_helper", __FILE__)

module Queenbee
  class OrderTest < Test::Unit::TestCase
    should "create should return status 201" do
      response = Queenbee::Order.create(
                  date: "2014-07-01 14:50:28",
                  currency: "CAD", city: "Paris",
                  country: "Canada", client_email: "d@email.com",
                  uid: SecureRandom.hex(4))
      assert_equal "201", response.code
    end

    should "raise Queenbee::AuthenticationError if not token provided" do
      Queenbee.token = nil
      assert_raises(Queenbee::AuthenticationError) {Queenbee::Order.create}
    end

    should "raise Queenbee::InvalidRequestError if not enough parameters" do
      begin
      rescue JSON::ParserError
        assert_raises(Queenbee::InvalidRequestError) { Queenbee::Order.create }
      end
    end

    should "Update should return 200" do
      uid = SecureRandom.hex(4)
      response1 = Queenbee::Order.create(
          date: "2014-07-01 14:50:28",
          currency: "CAD", city: "Paris",
          country: "Canada", client_email: "d@email.com",
          uid: uid)
      response = Queenbee::Order.save(
          date: "2014-07-01 14:50:28",
          currency: "CAD", city: "Paris",
          country: "Canada", client_email: "kk@email.com",
          uid: uid)
      assert_equal "200", response.code
    end

    should "Update should return 404 if UID missing" do
      response1 = Queenbee::Order.create(
          date: "2014-07-01 14:50:28",
          currency: "CAD", city: "Paris",
          country: "Canada", client_email: "d@email.com",
          uid: SecureRandom.hex(4))
      response = Queenbee::Order.save(
          date: "2014-07-01 14:50:28",
          currency: "CAD", city: "Paris",
          country: "Canada", client_email: "kk@email.com",
          uid: "")
      assert_equal "404", response.code
    end

  end
end
