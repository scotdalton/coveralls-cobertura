$:.push File.expand_path('../lib', __FILE__)

require 'coveralls/cobertura/version'

# Gem description and dependencies:
Gem::Specification.new do |s|
  s.name        = 'coveralls-cobertura'
  s.version     = Coveralls::Cobertura::VERSION
  s.authors     = ['Scot Dalton']
  s.email       = ['scotdalton@gmail.com']
  s.homepage    = 'https://github.com/scotdalton/coveralls-cobertura'
  s.summary     = "Covert Cobertura XML to Coveralls"
  s.description = "Covert Cobertura XML to Coveralls source files payload"
  s.license     = 'MIT'

  s.files = Dir['lib/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'require_all', '~> 1.3.0'
  s.add_dependency 'multi_xml', '~> 0.5.0'

  s.add_development_dependency 'rspec', '~> 3.1.0'
  s.add_development_dependency 'ox', '~> 2.1.0'
  s.add_development_dependency 'pry', '~> 0.10'
end
