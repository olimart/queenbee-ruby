# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "queenbee/version"

Gem::Specification.new do |spec|
  spec.name          = "queenbee"
  spec.version       = Queenbee::VERSION
  spec.authors       = ["Olivier"]
  spec.email         = ["olivier@yafoy.com"]
  spec.summary       = "Ruby gem to send orders & events to Queenbee main app."
  spec.description   = "E-commerce analytics platform"
  spec.homepage      = "https://github.com/olimart/queenbee-ruby"
  spec.license       = "MIT"

  spec.files         = Dir["LICENSE.md", "README.md", "lib/**/*"]
  spec.test_files    = Dir["test/**/*.rb"]

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 0"

  spec.add_dependency("json", "> 1.8")

  spec.add_development_dependency "shoulda", "~> 3.4"
  spec.add_development_dependency "test-unit", "~> 3"
end
