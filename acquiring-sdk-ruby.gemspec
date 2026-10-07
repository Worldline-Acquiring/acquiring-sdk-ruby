Gem::Specification.new do |spec|
  spec.name           = 'acquiring-sdk-ruby'
  spec.version        = '4.0.0'
  spec.authors        = ['Worldline Acquiring']
  spec.email          = ['github.acquiring@worldline.com']
  spec.summary        = %q{SDK to communicate with the Worldline Acquiring platform using the Worldline Acquiring API}
  spec.description    = %q{SDK to communicate with the Worldline Acquiring platform using the Worldline Acquiring API}
  spec.homepage       = %q{https://github.com/Worldline-Acquiring/acquiring-sdk-ruby}
  spec.license        = 'MIT'

  # exclude hidden files like .gitignore
  spec.files          = Dir['lib/**/*'] + Dir['spec/**/*'] +
                        ['acquiring-sdk-ruby.gemspec', 'Gemfile', 'LICENSE.txt', 'Rakefile', 'README.md']
  spec.executables    = spec.files.grep(%r{^bin\/}) { |f| File.basename(f) }
  spec.test_files     = spec.files.grep(%r{^(test|spec|features)\/})
  spec.require_paths  = ['lib']

  spec.required_ruby_version = '>= 3.2'

  spec.add_dependency 'httpclient', '~> 2.9'
  spec.add_dependency 'concurrent-ruby', '~> 1.3', '>= 1.3.5'
  spec.add_dependency 'base64', '~> 0.3'

  spec.add_development_dependency 'yard', '~> 0.9'
  spec.add_development_dependency 'rspec', '~> 3.13'
  spec.add_development_dependency 'webmock', '~> 3.26'
  spec.add_development_dependency 'sinatra', '~> 4.2'
  spec.add_development_dependency 'webrick', '~> 1.9'
  spec.add_development_dependency 'rackup', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 13.4'
  # spec.metadata['yard.run'] = 'yri'  # compiles yard doc on install
end
