class FKeyToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :users, index: true, foreign_key: true
  end
end
