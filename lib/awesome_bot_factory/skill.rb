module AwesomeBotFactory
  class Skill

    def self.matches(*matches)
      matches.each_with_index do |name,index|
        define_method name do 
          self.message["match"][index+1]
        end
      end
    end
  
    def self.register(details)
      Net::HTTP.post_form(URI.parse('http://awesomebotfactory.com/skills'), details)
    end
  
    def self.call(env)
      bot = self.new(env["rack.input"].read)
      [200, {"Content-Type" => "application/json"}, [bot.reply.to_json]]
    end
  
    def initialize(body)
      body = body.read if body.respond_to?(:read)
      self.message = JSON.parse(body)
    end
  
    def method_missing(name, *args)
      return self.message[name.to_s] if self.message.key?(name.to_s)
      return self.message[name.to_sym] if self.message.key?(name.to_sym)
      nil
    end
  end
end