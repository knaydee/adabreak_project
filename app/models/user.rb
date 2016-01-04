class User < ActiveRecord::Base
  has_many :giftees


  validates :name, presence: true
  validates :name, uniqueness: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates_confirmation_of :password, :message => "Passwords should match"
  has_secure_password
  
end
