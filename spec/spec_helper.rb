$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "rspec"
require "awesome_bot_factory"

class TestSkill < AwesomeBotFactory::Skill
  
end