class Message < ActiveRecord::Base
    belongs_to :user
    
    validates :body, presence: true
    validates :users_id, presence: true
    
end
