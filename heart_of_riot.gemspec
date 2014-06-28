# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heart_of_riot/version'

Gem::Specification.new do |spec|
  spec.name          = "heart_of_riot"
  spec.version       = HeartOfRiot::VERSION
  spec.authors       = ["James Liu"]
  spec.email         = ["jaycliu@gmail.com"]
  spec.summary       = %q{Access to the Riot League of Legends API}
  spec.description   = %q{A gem that makes it easy to grab, prepare data for analysis from the Riot League of Legends API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json"
  spec.add_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
