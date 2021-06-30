class FacebookApi
  def send_message(message_body)
    response = HTTParty.post("https://graph.facebook.com/v10.0/me/messages?access_token=#{ENV['FB_ACCESS_TOKEN']}",
    headers: {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    },
    debug_output: $stdout,
    body: message_body)
  end
end
