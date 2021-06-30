class AddOptinFbToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :optin_fb, :boolean
  end
end
