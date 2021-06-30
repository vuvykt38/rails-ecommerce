module MessengerResponses
  class TextFromUser
    def call_1(sender_id, received_message)
      {
        "recipient" => {
          "id" => sender_id
        },
        "messaging_type" =>  "RESPONSE",
        "message" => {
          "text" =>  "Sorry, but I don’t recognize \"#{received_message}\"",
        }
      }.to_json
    end

    def call_2(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "messaging_type" =>  "RESPONSE",
        "message" => {
          "text" =>  "At any time, use the menu below to navigate through the features",
        }
      }.to_json
    end

    def call_3(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "messaging_type" =>  "RESPONSE",
        "message" => {
          "text" =>  "What we can do to help you today?",
          "quick_replies" => [
            {
              "content_type" => "text",
              "title" => "Book suggestions",
              "payload" => "Book suggestions"
            },{
              "content_type" => "text",
              "title" => "Talk to an agent",
              "payload" => "Talk to an agent"
            }
          ]
        }
      }.to_json
    end
  end
end


