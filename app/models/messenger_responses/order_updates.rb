module MessengerResponses
  class OrderUpdates
    def call(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "messaging_type" =>  "RESPONSE",
        "message" => {
          "text" =>  "We'll be happy to help you. Select from the following",
          "quick_replies" => [
            {
              "content_type" => "text",
              "title" => "Link my Account",
              "payload" => "Link my Account"
            },{
              "content_type" => "text",
              "title" => "Search by order number",
              "payload" => "Order Number"
            },{
              "content_type" => "text",
              "title" => "Talk to an agent",
              "payload" => "CARE_HELP"
            }
          ]
        }
      }.to_json
    end
  end
end
