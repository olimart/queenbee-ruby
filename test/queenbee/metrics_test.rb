require File.expand_path("../../test_helper", __FILE__)

module Queenbee
  class MetricsTest < Test::Unit::TestCase
    should "summary should return status 201" do
      response = Queenbee::Metrics.summary(start_date: "2014-07-01", end_date: "2014-07-02")
      assert_equal "201", response.code
    end
  end
end
