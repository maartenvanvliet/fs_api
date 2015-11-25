# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fs_api/version'

Gem::Specification.new do |spec|
  spec.name          = "fs_api"
  spec.version       = FsApi::VERSION
  spec.authors       = ["Maarten van Vliet"]
  spec.email         = ["maartenvanvliet@gmail.com"]
  spec.summary       = %q{Ruby-Api library for factuursturen.nl }
  spec.description   = %q{Ruby-Api library for factuursturen.nl }
  spec.homepage      = "https://github.com/maartenvanvliet/fs_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "webmock", "~> 1.21"
end
