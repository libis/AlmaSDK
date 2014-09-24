# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'AlmaSDK/version'

Gem::Specification.new do |spec|
  spec.name          = "AlmaSDK"
  spec.version       = AlmaSDK::VERSION
  spec.authors       = ["Mehmet Celik"]
  spec.email         = ["mehmet@celik.be"]
  spec.summary       = %q{ExLibris Alma REST library}
  spec.description   = %q{ExLibris Alma REST library}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "api_cache"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "activemodel"
  spec.add_runtime_dependency "nori"

end
