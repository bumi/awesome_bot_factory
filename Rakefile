require 'bundler'
Bundler.setup
require "rspec"
require "rspec/core/rake_task"

task :gem => :build
task :build do
  system "gem build awesome_bot_factory.gemspec"
end

task :install => :build do
  system "sudo gem install awesome_bot_factory-#{AwesomeBotFactory::VERSION}.gem"
end

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end
