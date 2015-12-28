class Giftee < ActiveRecord::Base
  has_many :wishlists
  validates :name, presence: true
end
