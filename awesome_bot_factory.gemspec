# encoding: utf-8
$: << File.expand_path('../lib', __FILE__)
require "awesome_bot_factory/version"

Gem::Specification.new do |s|
  s.name        = "awesome_bot_factory"
  s.version     = AwesomeBotFactory::VERSION
  s.authors     = ["Michael Bumann"]
  s.email       = ["michael@railslove.com"]
  s.homepage    = ""
  s.summary     = %q{The AwesomeBotFactory gem}
  s.description = %q{The AwesomeBotFactory lets you generate lovely bots for your campfire rooms. This gem brings a simple skeleton to build your bots}

  s.rubyforge_project = "[none]"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_path = "lib"

  s.add_dependency 'json'
  s.add_dependency 'activesupport', '~> 3.0.0'
  s.add_dependency 'thor', '~> 0.14.6'
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
