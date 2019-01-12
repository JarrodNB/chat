class User < ActiveRecord::Base
    has_many :messages, dependent: :destroy
    validates :email, presence: true
    validates :password, presence: true
    validates :comfirm_password, presence: true
end
