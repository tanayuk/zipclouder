# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zipclouder/version'

Gem::Specification.new do |spec|
  spec.name          = "zipclouder"
  spec.version       = Zipclouder::VERSION
  spec.authors       = ["web-reshio"]
  spec.email         = ["s.kobayashi07@gmail.com"]
  spec.description   = %q{A Ruby library for zipcloud API. https://github.com/web-reshio/zipclouder }
  spec.summary       = %q{A Ruby library for zipcloud API}
  spec.homepage      = "https://github.com/web-reshio/zipclouder"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
