# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/help_query/version'

# rubocop:disable LineLength
Gem::Specification.new do |spec|
  spec.name          = 'ruboty-help_query'
  spec.version       = Ruboty::HelpQuery::VERSION
  spec.authors       = ['tbpgr']
  spec.email         = ['tbpgr@tbpgr.jp']
  spec.summary       = 'An Ruboty Handler + Actions to show all help commands that match <query>.'
  spec.description   = 'An Ruboty Handler + Actions to show all help commands that match <query>.'
  spec.homepage      = 'https://github.com/tbpgr/ruboty-help_query'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ruboty'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'simplecov'
end
# rubocop:enable LineLength
