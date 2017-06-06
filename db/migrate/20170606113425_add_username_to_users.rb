class AddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false, index: true, unique: true
  end
end
