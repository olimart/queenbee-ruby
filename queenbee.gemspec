# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'queenbee/version'

Gem::Specification.new do |spec|
  spec.name          = "queenbee"
  spec.version       = Queenbee::VERSION
  spec.authors       = ["Olivier"]
  spec.email         = ["olivier@yafoy.com"]
  spec.summary       = %q{Gem to send e-commerce orders to the Queenbee central app.}
  spec.description   = "E-commerce analytics platform"
  spec.homepage      = "https://github.com/olimart/queenbee-ruby"
  spec.license       = "MIT"

  spec.files         = Dir['LICENSE.md', 'README.md', 'lib/**/*']
  spec.test_files    = Dir['test/**/*.rb']

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_dependency("json", "~> 1.8.1")

  spec.add_development_dependency("shoulda", "~> 3.4.0")
  spec.add_development_dependency("test-unit")
end
