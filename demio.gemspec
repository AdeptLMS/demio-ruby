
# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'demio/version'

Gem::Specification.new do |spec|
  spec.name          = 'demio'
  spec.version       = Demio::VERSION
  spec.authors       = ['Timur Valeev']
  spec.email         = ['kibenimatik@yandex.ru']

  spec.summary       = 'Client library for Demio API'
  spec.description   = 'Client library for Demio API'
  spec.homepage      = 'https://github.com/kibenimatik/demio-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4'

  spec.add_dependency 'activesupport'
  spec.add_dependency 'httparty'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
end
