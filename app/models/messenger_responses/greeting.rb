module MessengerResponses
  class Greeting
    def call(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "messaging_type" =>  "RESPONSE",
        "message" => {
          "text" =>  "Hi {{user_first_name}}! Welcome to Book Store where you'll find books that you love",
        }
      }.to_json
    end
  end
end
