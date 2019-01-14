class DropUsernameMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :username
  end
end
