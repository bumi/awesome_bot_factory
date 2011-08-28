module AwesomeBotFactory
  class Skill
    include ActiveSupport::Configurable
    
    attr_accessor :message
    
    def self.matches(*matches)
      matches.each_with_index do |name,index|
        define_method name do 
          self.message["match"][index+1]
        end
      end
    end
    
    def self.call(env)
      message = JSON.parse(env["rack.input"].read)
      [200, {"Content-Type" => "application/json"}, [ self.new(message).reply.to_json] ]
    end
  
    def initialize(campfire_message)
      self.message = campfire_message
    end
  
    def method_missing(name, *args)
      return self.message[name.to_s] if self.message.key?(name.to_s)
      return self.message[name.to_sym] if self.message.key?(name.to_sym)
      super(name,*args)
    end
  end
end