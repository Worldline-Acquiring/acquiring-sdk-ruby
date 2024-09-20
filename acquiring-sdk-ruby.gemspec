Gem::Specification.new do |spec|
  spec.name           = 'acquiring-sdk-ruby'
  spec.version        = '0.1.0'
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

  spec.required_ruby_version = '>= 2.0'

  spec.add_dependency 'httpclient', '~> 2.8'
  spec.add_dependency 'concurrent-ruby', '~>1.0'

  spec.add_development_dependency 'yard', '~> 0.9'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'webmock', '~> 2.1'
  spec.add_development_dependency 'sinatra', '~> 2.1'
  spec.add_development_dependency 'webrick', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 12.3', '>= 12.3.3'
  # spec.metadata['yard.run'] = 'yri'  # compiles yard doc on install
end
