module MessengerResponses
  class Feedback
    def call_1(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "messaging_type" =>  "RESPONSE",
        "message" => {
          "text" =>  "Thanks for the feedback",
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
          "text" =>  "Thanks for the feedback, if there something we should improve feel free to comment with #suggestion",
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
          "text" =>  "Thanks for telling us. Sorry to hear that, if there something we can do to turn this let us know",
          "quick_replies" => [
            {
              "content_type" => "text",
              "title" => "Talk To Agent",
              "payload" => "Talk to an agent"
            }
          ]
        }
      }.to_json
    end

    def call_4(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "messaging_type" =>  "RESPONSE",
        "message" => {
          "text" =>  "Your suggestion has been recorded for future review by the team. Thank you",
        }
      }.to_json
    end
  end
end


