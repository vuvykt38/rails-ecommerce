class AddEventTypeToWebhooks < ActiveRecord::Migration[6.0]
  def change
    add_column :webhooks, :event_type, :string
  end
end
