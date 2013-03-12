# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-heello/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-heello"
  s.version     = OmniAuth::Heello::VERSION
  s.authors     = ["Steve Corona"]
  s.email       = ["stevecorona@me.com"]
  s.homepage    = "https://github.com/stevecorona/omniauth-heello"
  s.summary     = %q{OmniAuth strategy for Heello}
  s.description = %q{OmniAuth strategy for Heello}
  s.license     = "MIT"

  s.rubyforge_project = "omniauth-heello"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.0'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
end