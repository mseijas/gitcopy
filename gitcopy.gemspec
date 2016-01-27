# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gitcopy/version'

Gem::Specification.new do |spec|
  spec.name          = "gitcopy"
  spec.version       = Gitcopy::VERSION
  spec.authors       = ["Matias Seijas"]
  spec.email         = ["matiseijas@gmail.com"]

  spec.summary       = %q{Download the contents of a github repo without cloning it.}
  spec.description   = %q{Download the contents of a github repo.}
  spec.homepage      = "https://github.com/mseijas/gitcopy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "git"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
