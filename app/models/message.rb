class Message < ActiveRecord::Base
    belongs_to :user
    
    validates :body, presence: true, length: { minimum: 1, maximum: 144 }
    validates :user_id, presence: true
    validates :username, presence: true
    
end
