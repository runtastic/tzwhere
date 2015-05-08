# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tzwhere/version'

Gem::Specification.new do |spec|
  spec.name          = "tzwhere"
  spec.version       = TZWhere::VERSION
  spec.authors       = ["Adam Daniels", "Andreas Eger"]
  spec.email         = ["adam@mediadrive.ca", "andreas.eger@runtastic.com"]
  spec.summary       =
    'Time zone lookup by latitude/longitude using nearest neighbor implementation.'
  spec.homepage      = "http://github.com/adam12/tzwhere"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "geokdtree"
  spec.add_dependency "activesupport"
  spec.add_development_dependency "bundler", "~>1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~>3.2"

  spec.add_development_dependency "pry"
end
