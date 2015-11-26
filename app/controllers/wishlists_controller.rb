class WishlistsController < ApplicationController

  def index
    id = params[:giftee_id]
    @giftee = Giftee.find(id)
    @title = "#{@giftee.name}'s Wishlist"
    @wishlist = @giftee.wishlists
  end


end
