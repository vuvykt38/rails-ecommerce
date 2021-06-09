class Webhook < ApplicationRecord
  after_create :received_webhook

  def received_webhook
    webhook_event = payload["entry"][0]["messaging"][0]
    sender_id = webhook_event["sender"]["id"]
    if webhook_event["postback"].present?
      handle_postback(sender_id, webhook_event)
    elsif webhook_event["message"].present?
      handle_message(sender_id, webhook_event)
    end
  end

  def handle_postback(sender_id, webhook_event)
    payload = webhook_event["postback"]["payload"]
    if payload == "CARE_HELP"
      send_message(MessengerResponses::CareHelp.new.call(sender_id))
    elsif payload == "get_started"
      sender_id = webhook_event["sender"]["user_ref"]
      send_message(MessengerResponses::Greeting.new.call(sender_id))
      send_message(MessengerResponses::TextFromUser.new.call_2(sender_id))
      send_message(MessengerResponses::TextFromUser.new.call_3(sender_id))
    end
  end

  def handle_message(sender_id, webhook_event)
    received_message = webhook_event["message"]["text"]
    if received_message == "Order Inquiries"
      send_message(MessengerResponses::OrderInquiries.new.call_1(sender_id, received_message))
      send_message(MessengerResponses::OrderInquiries.new.call_2(sender_id))
      send_message(MessengerResponses::OrderInquiries.new.call_3(sender_id))

    else
      send_message(MessengerResponses::TextFromUser.new.call_1(sender_id, received_message))
      send_message(MessengerResponses::TextFromUser.new.call_2(sender_id))
      send_message(MessengerResponses::TextFromUser.new.call_3(sender_id))
    end
  end

  def send_message(message_body)
    FacebookApi.new.send_message(message_body)
  end
end
