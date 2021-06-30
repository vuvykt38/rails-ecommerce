module MessengerResponses
  class OrderInquiries
    def call_1(sender_id, received_message)
      {
        "recipient" => {
            "id" => sender_id
         },
        "message" => {
            "text" => "Hi, my name is Laura, I'm here to assist you with any questions you might have about your #{received_message}",
         },
        "persona_id" =>  "192399676082780"
      }.to_json
    end

    def call_2(sender_id)
      {
        "recipient" => {
            "id" => sender_id
         },
        "message" => {
            "text" => "This is as far as the demo goes. Leverage the power of the messenger platform for your business. See https://fb.me/get-sample-oc to learn how to build a similar experience",
         },
        "persona_id" =>  "192399676082780"
      }.to_json
    end

    def call_3(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "messaging_type" =>  "RESPONSE",
        "message" => {
          "text" =>  "Hi, want to get quick feedback on your recent experience with Laura",
          "quick_replies" => [
            {
              "content_type" => "text",
              "title" => "😀",
              "payload" => "Good"
            },{
              "content_type" => "text",
              "title" => "🙂",
              "payload" => "So so"
            },{
              "content_type" => "text",
              "title" => "🙁",
              "payload" => "Bad"
            }
          ]
        }
      }.to_json
    end

  end
end


