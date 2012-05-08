# -*- encoding: utf-8 -*-
require File.expand_path('../lib/penguin/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jimmy Cuadra"]
  gem.email         = ["jimmy@jimmycuadra.com"]
  gem.description   = %q{Penguin is a tool for creating presentations.}
  gem.summary       = %q{Penguin is a tool for creating presentations.}
  gem.homepage      = "https://github.com/jimmycuadra/penguin"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.name          = "penguin"
  gem.require_paths = ["lib"]
  gem.version       = Penguin::VERSION::STRING

  gem.add_runtime_dependency("thor", ">= 0.15.0")

  gem.add_development_dependency("rspec", ">= 2.10.0")
end
