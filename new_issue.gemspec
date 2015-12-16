# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'new_issue/version'

Gem::Specification.new do |spec|
  spec.name          = NewIssue::PROJECT
  spec.version       = NewIssue::VERSION
  spec.authors       = ['Daniel Khamsing']
  spec.email         = ['dkhamsing8@gmail.com']

  spec.summary       = NewIssue::PROJECT_DESCRIPTION
  spec.description   = NewIssue::PROJECT_DESCRIPTION
  spec.homepage      = NewIssue::PROJECT_URL
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = [NewIssue::PROJECT]
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency 'awesome_bot'
  spec.add_runtime_dependency 'octokit', '~> 4.2.0' # github
  spec.add_runtime_dependency 'netrc', '~> 0.11.0' # github creds

  end
