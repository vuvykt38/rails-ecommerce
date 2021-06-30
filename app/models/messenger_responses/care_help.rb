module MessengerResponses
  class CareHelp
    def call(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "messaging_type" =>  "RESPONSE",
        "message" => {
          "text" =>  "To connect you with the right team please let me know what this is about?",
          "quick_replies" => [
            {
              "content_type" => "text",
              "title" => "Order Inquiries",
              "payload" => "Order Inquiries"
            },{
              "content_type" => "text",
              "title" => "Billing Issues",
              "payload" => "Billing Issues"
            },{
              "content_type" => "text",
              "title" => "Other",
              "payload" => "Other"
            }
          ]
        }
      }.to_json
    end
  end
end
