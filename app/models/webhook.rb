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
    user_selected_option = webhook_event["postback"]["payload"]
    case user_selected_option
    when "CARE_HELP"
      send_message(MessengerResponses::CareHelp.new.call(sender_id))
    when "get_started"
      sender_id = webhook_event["sender"]["user_ref"]
      send_message(MessengerResponses::Greeting.new.call(sender_id))
      send_message(MessengerResponses::TextFromUser.new.call_2(sender_id))
      send_message(MessengerResponses::TextFromUser.new.call_3(sender_id))
    when "ORDER_UPDATES"
      send_message(MessengerResponses::OrderUpdates.new.call(sender_id))
    end
  end

  def handle_message(sender_id, webhook_event)
    received_message = webhook_event["message"]["text"]
    case received_message
    when "Order Inquiries", "Billing Issues", "Other"
      send_message(MessengerResponses::OrderInquiries.new.call_1(sender_id, received_message))
      send_message(MessengerResponses::OrderInquiries.new.call_2(sender_id))
      send_message(MessengerResponses::OrderInquiries.new.call_3(sender_id))
    when "Talk to an agent"
      send_message(MessengerResponses::CareHelp.new.call(sender_id))
    when "😀"
      send_message(MessengerResponses::Feedback.new.call_1(sender_id))
    when "🙂"
      send_message(MessengerResponses::Feedback.new.call_2(sender_id))
    when "🙁"
      send_message(MessengerResponses::Feedback.new.call_3(sender_id))
    when "#"
      send_message(MessengerResponses::Feedback.new.call_4(sender_id))
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
