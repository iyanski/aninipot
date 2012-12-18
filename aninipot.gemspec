# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'aninipot'
  s.version     = '0.0.1'
  s.date        = '2012-11-24'
  s.email       = 'me@iantusil.com'
  
  s.summary     = "A ruby gem for consuming Firefly API"
  s.description = "A ruby gem for consuming Firefly API (currently supports SMS only)."
  s.author      = "Ian Bert Tusil"
  s.homepage    = 'http://www.fireflyapi.com/'
  s.license     = 'MIT'

  s.platform    = Gem::Platform::RUBY
  s.require_paths = %w[lib]
  s.files       = `git ls-files`.split("\n")
  s.test_files  = Dir['test/*.rb']
    
  s.add_development_dependency 'minitest', '~> 4.3.3'
end