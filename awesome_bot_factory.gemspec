# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "awesome_bot_factory/version"

Gem::Specification.new do |s|
  s.name        = "awesome_bot_factory"
  s.version     = AwesomeBotFactory::VERSION
  s.authors     = ["Michael Bumann"]
  s.email       = ["michael@railslove.com"]
  s.homepage    = ""
  s.summary     = %q{The AwesomeBotFactory gem}
  s.description = %q{The AwesomeBotFactory lets you generate lovely bots for your campfire rooms. This gem brings a simple skeleton to build your bots}

  s.rubyforge_project = "awesome_bot_factory"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
