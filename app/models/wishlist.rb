class Wishlist < ActiveRecord::Base
  belongs_to :giftee
  validates :item, presence: true
end
