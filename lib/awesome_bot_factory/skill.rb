module AwesomeBotFactory
  class Skill
    include ActiveSupport::Configurable
    
    attr_accessor :message
    
    def self.matches(*matches)
      @@matches = matches
    end
    
    def self.call(env)
      message = JSON.parse(env["rack.input"].read)
      [200, {"Content-Type" => "application/json"}, [ self.new(message).reply.to_json] ]
    end
  
    def initialize(campfire_message={})
      self.message = campfire_message
      self.message["match"] ||= {} # let's just make sure we have an hash there and don't break if it is in any case empty
    end
    
    def read_attribute(attr)
      index = @@matches.index(attr.to_sym)
      return nil unless index
      self.message["match"][index+1]
    end
    
    def method_missing(name, *args)
      return self.message[name.to_s] if self.message.key?(name.to_s)
      return self.message[name.to_sym] if self.message.key?(name.to_sym)
      return self.read_attribute(name) if self.read_attribute(name)
      super(name,*args)
    end
  end
end