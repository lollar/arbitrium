# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arbitrium/version'

Gem::Specification.new do |spec|
  spec.name          = "arbitrium"
  spec.version       = Arbitrium::VERSION
  spec.authors       = ["Lollar"]
  spec.email         = ["lollar.mchl@gmail.com"]

  spec.summary       = %q{An easy to use gem for creating service objects}
  spec.description   = %q{This gem was inspired by the overabundance of logic that I continually saw in controllers in the Rails app I was working on. I've decided to implement a straight ruby gem that has no dependencies on Rails.  This gem will remain simple in scope and will be modeled after the way that I like to write service object classes.}
  spec.homepage      = "https://github.com/lollar/arbitrium"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
