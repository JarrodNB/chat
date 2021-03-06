class User < ActiveRecord::Base
  
  before_create :generate_authentication_token!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :messages
  validates :auth_token, uniqueness: true
  validates :email, uniqueness: true, length: { minimum: 1, maximum: 50 }
  validates :username, uniqueness: true, length: { minimum: 1, maximum: 25 }
  
  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
