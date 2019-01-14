class ChangeMessageEmailToUsername < ActiveRecord::Migration
  def change
    rename_column :messages, :user_email, :username
  end
end
