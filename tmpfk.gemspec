# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tmpfk/version'

Gem::Specification.new do |spec|
  spec.name          = 'tmpfk'
  spec.version       = Tmpfk::VERSION
  spec.authors       = ['k1LoW']
  spec.email         = ['k1lowxb@gmail.com']

  spec.summary       = 'Temporary foreign key setting tool for using ER generator for "Keyless entry (SQL Antipatterns)" schema.'
  spec.description   = 'Temporary foreign key setting tool for using ER generator for "Keyless entry (SQL Antipatterns)" schema.'
  spec.homepage      = 'https://github.com/k1LoW/tmpfk'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'ridgepole'
  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'term-ansicolor'
  spec.add_development_dependency 'mysql2'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.40.0'
  spec.add_development_dependency 'octorelease'
  spec.add_development_dependency 'pry'
end
