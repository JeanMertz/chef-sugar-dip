# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chef/sugar/dip/version'

Gem::Specification.new do |spec|
  spec.name          = 'chef-sugar-dip'
  spec.version       = Chef::Sugar::Dip::VERSION
  spec.authors       = ['Jean Mertz']
  spec.email         = ['jean@mertz.fm']
  spec.description   = 'An extension to the awesome "chef-sugar" gem ' \
                       'produced by Seth Vargo.'
  spec.summary       = 'A collection of helper methods and modules, extending' \
                       ' the helper methods available in the "chef-sugar" gem.'
  spec.homepage      = 'https://github.com/JeanMertz/chef-sugar-dip'
  spec.license       = 'Apache 2.0'

  spec.required_ruby_version = '>= 1.9'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'chef-sugar', '~> 1.2', '>= 1.2.6'

  spec.add_development_dependency 'bundler',         '~> 1.3'
  spec.add_development_dependency 'chefspec',        '~> 3.0'
  spec.add_development_dependency 'berkshelf',       '~> 3.1'
  spec.add_development_dependency 'test-kitchen',    '~> 1.1'
  spec.add_development_dependency 'kitchen-vagrant', '~> 0.14'
end
