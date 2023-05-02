require File.expand_path("../../test_helper", __FILE__)

module Queenbee
  class MetricsTest < Test::Unit::TestCase
    should "summary should return status 200" do
      VCR.use_cassette("metrics.summary") do
        response = Queenbee::Metrics.summary(start_date: "2014-07-01", end_date: "2014-07-02")
        assert_equal "200", response.code
      end
    end

    should "all should return status 200" do
      VCR.use_cassette("metrics.all") do
        response = Queenbee::Metrics.all
        assert_equal "200", response.code
      end
    end
  end
end
