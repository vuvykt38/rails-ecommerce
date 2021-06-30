module MessengerResponses
  class BookSuggestions

    def call_1(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "messaging_type" =>  "RESPONSE",
        "message" => {
          "text" =>  "Great! Let's get started. First, what is your favourite book genre?",
          "quick_replies" => [
            {
              "content_type" => "text",
              "title" => "Action",
              "payload" => "Action"
            },{
              "content_type" => "text",
              "title" => "Romantic Comedy",
              "payload" => "Romantic Comedy"
            },{
              "content_type" => "text",
              "title" => "Drama",
              "payload" => "Drama"
            },{
              "content_type" => "text",
              "title" => "Talk to sales",
              "payload" => "Talk to an agent"
            }
          ]
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
          "text" =>  "How much are you looking to spend?",
          "quick_replies" => [
            {
              "content_type" => "text",
              "title" => "~ $20",
              "payload" => "~ $20"
            },{
              "content_type" => "text",
              "title" => "~ $30",
              "payload" => "~ $30"
            },{
              "content_type" => "text",
              "title" => "+ $50",
              "payload" => "+ $50"
            },{
              "content_type" => "text",
              "title" => "Talk to sales",
              "payload" => "Talk to an agent"
            }
          ]
        }
      }.to_json
    end

    def call_3(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "message" => {
          "attachment" => {
            "type" => "template",
            "payload" => {
              "template_type" => "generic",
              "elements" => [
                 {
                  "title" => "2STATES",
                  "image_url" => "https://demo.joomlabuff.com/bookstore/images/products/books/book9.png",
                  "subtitle" => "Molly eleifend vel risus eget ultricies. Praesent sed tortor sem.",
                  "default_action" =>  {
                    "type" =>  "web_url",
                    "url" =>  "https://vuvykt38-local.jointunnel.com/products/10",
                    "webview_height_ratio" =>  "tall",
                  },
                  "buttons" => [
                    {
                      "type" => "web_url",
                      "url" => "https://vuvykt38-local.jointunnel.com/products/10",
                      "title" => "View Website"
                    },{
                      "type" => "postback",
                      "title" => "Start Chatting",
                      "payload" => "CARE_HELP"
                    }
                  ]
                }
              ]
            }
          }
        }
      }.to_json
    end

    def call_4(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "message" => {
          "attachment" => {
            "type" => "template",
            "payload" => {
              "template_type" => "generic",
              "elements" => [
                 {
                  "title" => "NECESSARY LIES 4",
                  "image_url" => "https://demo.joomlabuff.com/bookstore/images/products/books/book16.png",
                  "subtitle" => "Nulla eleifend vel risus eget ultricies. Praesent sed tortor sem.",
                  "default_action" =>  {
                    "type" =>  "web_url",
                    "url" =>  "https://vuvykt38-local.jointunnel.com/products/6",
                    "webview_height_ratio" =>  "tall",
                  },
                  "buttons" => [
                    {
                      "type" => "web_url",
                      "url" => "https://vuvykt38-local.jointunnel.com/products/6",
                      "title" => "View Website"
                    },{
                      "type" => "postback",
                      "title" => "Start Chatting",
                      "payload" => "CARE_HELP"
                    }
                  ]
                }
              ]
            }
          }
        }
      }.to_json
    end

    def call_5(sender_id)
      {
        "recipient" => {
          "id" => sender_id
        },
        "message" => {
          "attachment" => {
            "type" => "template",
            "payload" => {
              "template_type" => "generic",
              "elements" => [
                 {
                  "title" => "LOVE YOURSELF 4",
                  "image_url" => "https://demo.joomlabuff.com/bookstore/images/products/books/book11.png",
                  "subtitle" => "Nulla eleifend vel risus eget ultricies. Praesent sed tortor sem.",
                  "default_action" =>  {
                    "type" =>  "web_url",
                    "url" =>  "https://vuvykt38-local.jointunnel.com/products/6",
                    "webview_height_ratio" =>  "tall",
                  },
                  "buttons" => [
                    {
                      "type" => "web_url",
                      "url" => "https://vuvykt38-local.jointunnel.com/products/6",
                      "title" => "View Website"
                    },{
                      "type" => "postback",
                      "title" => "Start Chatting",
                      "payload" => "CARE_HELP"
                    }
                  ]
                }
              ]
            }
          }
        }
      }.to_json
    end
  end
end
