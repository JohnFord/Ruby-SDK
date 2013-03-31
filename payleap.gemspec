# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'payleap/version'

Gem::Specification.new do |gem|
  gem.name          = "payleap"
  gem.version       = Payleap::VERSION
  gem.authors       = ["John Ford"]
  gem.email         = ["jwford@gmail.com"]
  gem.description   = %q{Ruby interface to the PayLeap payments API}
  gem.summary       = %q{Ruby interface to the PayLeap payments API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
