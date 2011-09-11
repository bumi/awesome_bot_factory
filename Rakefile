require 'bundler'
Bundler.setup
require "rspec"
require "rspec/core/rake_task"

task :gem => :build
task :build do
  system "gem build awesome_bot_factory.gemspec"
end

task :install => :build do
  system "gem install awesome_bot_factory-#{AwesomeBotFactory::VERSION}.gem"
end

task :release => :build do
  system "git tag -a #{AwesomeBotFactory::VERSION} -m 'Tagging #{AwesomeBotFactory::VERSION}'"
  system "git push --tags"
  system "gem push awesome_bot_factory-#{AwesomeBotFactory::VERSION}.gem"
end

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => :spec
