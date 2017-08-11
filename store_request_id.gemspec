# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'store_request_id/version'

Gem::Specification.new do |spec|
  spec.name          = 'store_request_id'
  spec.version       = StoreRequestId::VERSION
  spec.authors       = ['Guidespark', 'Maxime Chaisse-Leal']
  spec.email         = ['sysadmin@guidespark.com', 'maxime.chaisseleal@gmail.com']

  spec.summary       = 'Store the unique request id within a global state (RequestStore).'
  spec.description   = 'Store the unique request id within a global state (RequestStore).'
  spec.homepage      = 'https://github.com/SparkHub/gs-store-request-id'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'actionpack', '>= 3.0.2'
  spec.add_dependency 'activesupport', RUBY_VERSION >= '2.2.2' ? '>= 3.0.2' : '< 5.1.3'
  spec.add_dependency 'request_store', '>= 1.1'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
