module AwesomeBotFactory
  class ExamplePayload < Hash
    DEFAULTS = {
      "body" => "campfire message",
      "room_id" =>  "123456",
      "user_id" => "7890",
      "user" => {
        "name" => "Choco Bit",
        "avatar_url" => "http://asset0.37img.com/global/.../avatar.png",
        "type" => "Member",
        "admin" => false
      },
      "user_name" => "choco",
      "match" => ["key:command value", "command", "value"],
      "slug" => "hexhash"
    }

    def initialize(attributes={})
      self.merge!(DEFAULTS)
      self.merge!(attributes)
    end

    def as_hash
      self
    end

    def as_json
      as_hash.to_json
    end

  end
end
