require "json"
require "awesome_bot_factory/version"
require 'active_support/configurable'
require 'active_support/core_ext/hash/keys'

module AwesomeBotFactory
  autoload :Skill, 'awesome_bot_factory/skill'
  autoload :ExamplePayload, 'awesome_bot_factory/example_payload'
end