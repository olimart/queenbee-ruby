require 'queenbee'
require 'test/unit'
require 'shoulda'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'test/fixtures'
  config.hook_into :webmock
  config.filter_sensitive_data('<TOKEN>') { |interaction|
    auths = interaction.request.headers['Authorization'].first
    if (match = auths.match /Token token=/ )
      match.captures.first
    end
  }
end

class Test::Unit::TestCase
  setup do
  	Queenbee.api_base = 'http://localhost:3010/api'
    Queenbee.token    = '111'
  end

  teardown do
    Queenbee.token = nil
  end
end
