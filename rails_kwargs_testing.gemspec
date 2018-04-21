
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails_kwargs_testing/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_kwargs_testing"
  spec.version       = RailsKwargsTesting::VERSION
  spec.authors       = ["r7kamura"]
  spec.email         = ["r7kamura@gmail.com"]
  spec.summary       = "Provides Rails 5 compatible testing methods for gradual migration from Rails 4 to 5."
  spec.homepage      = "https://github.com/r7kamura/rails_kwargs_testing"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "< 5"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
