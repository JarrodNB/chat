class FixMessagesFk < ActiveRecord::Migration
  def change
    add_foreign_key :messages, :users
  end
end
