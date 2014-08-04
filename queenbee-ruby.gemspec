# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'queenbee/version'

Gem::Specification.new do |spec|
  spec.name          = "queenbee-ruby"
  spec.version       = Queenbee::VERSION
  spec.authors       = ["Olivier"]
  spec.email         = ["olivier@yafoy.com"]
  spec.summary       = %q{Gem to send e-commerce orders to the Queenbee central app.}
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_dependency("rest-client", "~> 1.4")
  spec.add_dependency("json", "~> 1.8.1")

  spec.add_development_dependency("mocha", "~> 0.13.2")
  spec.add_development_dependency("shoulda", "~> 3.4.0")
  spec.add_development_dependency("test-unit")
end