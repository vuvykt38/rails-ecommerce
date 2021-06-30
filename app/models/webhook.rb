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
    when "CURATION"
      send_message(MessengerResponses::BookSuggestions.new.call_1(sender_id))
    end
  end

  def handle_message(sender_id, webhook_event)
    received_message = webhook_event["message"]["text"]
    if webhook_event["message"]["quick_reply"]
      payload_message = webhook_event["message"]["quick_reply"]["payload"]
      case payload_message
      when "Order Inquiries", "Billing Issues", "Other"
        send_message(MessengerResponses::OrderInquiries.new.call_1(sender_id, received_message))
        send_message(MessengerResponses::OrderInquiries.new.call_2(sender_id))
        send_message(MessengerResponses::OrderInquiries.new.call_3(sender_id))
      when "Talk to an agent", "Talk to sales"
        send_message(MessengerResponses::CareHelp.new.call(sender_id))
      when "Good"
        send_message(MessengerResponses::Feedback.new.call_1(sender_id))
      when "So so"
        send_message(MessengerResponses::Feedback.new.call_2(sender_id))
      when "Bad"
        send_message(MessengerResponses::Feedback.new.call_3(sender_id))
      when "Book suggestions"
        send_message(MessengerResponses::BookSuggestions.new.call_1(sender_id))
      when "Action", "Romantic Comedy", "Drama"
        send_message(MessengerResponses::BookSuggestions.new.call_2(sender_id))
      when "~ $20"
        send_message(MessengerResponses::BookSuggestions.new.call_3(sender_id))
      when "~ $30"
        send_message(MessengerResponses::BookSuggestions.new.call_4(sender_id))
      when "+ $50"
      send_message(MessengerResponses::BookSuggestions.new.call_5(sender_id))
      end
    elsif received_message.start_with?("#")
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
