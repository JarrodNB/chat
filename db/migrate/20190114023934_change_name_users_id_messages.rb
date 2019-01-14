class ChangeNameUsersIdMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :users_id, :user_id
  end
end
