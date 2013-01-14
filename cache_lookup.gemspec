# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cache_lookup/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tom Fakes"]
  gem.email         = ["craz8@tomandlisa.us"]
  gem.description   = "Provide a cache system for single ActiveRecord objects with expiry on update and delete"
  gem.summary       = "Cached lookup of ActiveRecord objects with expiry on update"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cache_lookup"
  gem.require_paths = ["lib"]
  gem.version       = CacheLookup::VERSION

  gem.add_dependency "activesupport", ">= 3.0"
  gem.add_dependency "rails", ">= 3.0"
end
