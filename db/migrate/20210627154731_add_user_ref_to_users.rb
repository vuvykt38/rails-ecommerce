class AddUserRefToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_ref, :string
    add_index :users, :user_ref, unique: true
  end
end
