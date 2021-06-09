class CreateWebhooks < ActiveRecord::Migration[6.0]
  def change
    create_table :webhooks do |t|
      t.string :external_event_id
      t.string :provider
      t.json :payload
      t.timestamps
    end
    add_index :webhooks, [:external_event_id, :provider], { unique: true }
  end
end
