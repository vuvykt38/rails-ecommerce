class AddFbuidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fb_uid, :string
    add_column :users, :name, :string
    add_index :users, :fb_uid, unique: true
  end
end
