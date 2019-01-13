class AddEmailToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :user_email, :string
  end
end
