# encoding: utf-8

Gem::Specification.new do |s|
  s.name         = 'fnv_hash'
  s.version      = '0.0.1'
  s.authors      = ['Jordan Sitkin']
  s.summary      = "A wrapper around the rust fnv hasher"
  s.files        = Dir['{lib/**/*,[A-Z]*}']

  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'

  s.add_dependency 'helix_runtime', '~> 0.7.3'
  s.add_development_dependency 'rspec', '~> 3.6'
end
