class FacebookApi
  def send_message(message_body)
    response = HTTParty.post("https://graph.facebook.com/v10.0/me/messages?access_token=EAAEZAdalkmDwBAIlg9SUT17qWgpIZBhfwAUE2Wx4IKjp1u8WxOll8AoLY4Bymq7exNHBnmU0afQAoV7sNpQPJ0pD15kjtXbuwZBJHUx32HZAuYj8vWLYzCYHq8O08AHMvgSNCUsrHL8XN4MYJMPOhoHoyZCvHEnZBeoWbET8t4JcCbcpjnJbEVTPrL4h9YoZCgZD",
    headers: {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    },
    debug_output: $stdout,
    body: message_body)
  end
end
