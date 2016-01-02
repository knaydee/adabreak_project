class Giftee < ActiveRecord::Base
  has_many :wishlists
  belongs_to :user
end
