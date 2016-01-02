class User < ActiveRecord::Base
  has_many :giftees
end
