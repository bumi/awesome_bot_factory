$:.push File.expand_path("../lib", __FILE__)
require "awesome_bot_factory"
class ChocoBot < AwesomeBotFactory::Skill
  
  def reply
    "hallo"
  end
end