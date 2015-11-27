class WishlistsController < ApplicationController

  def index
    id = params[:giftee_id]
    @giftee = Giftee.find(id)
    @title = "#{@giftee.name}'s Wishlist"
    @wishlist = @giftee.wishlists
  end

  def show
    id = params[:giftee_id]
    @giftee = Giftee.find(id)
    @title = "Market Vendors"
    @wishlist = @giftee.wishlists
  end

  def new
    @wishlist = Wishlist.new(wishlist_params[:wishlist])
    @action = "create"
    @title = "Add Item"
  end

  def create
    @giftee_id = params[:giftee_id]
    new_params = wishlist_params[:wishlist]
    new_params[:giftee_id] = @giftee_id
    Wishlist.create(new_params)
    redirect_to giftee_wishlists_path
  end

  def edit
    @giftee = Giftee.find(id)
    @action = "update"
    @title = "Edit an Item"
    @wishlist = @giftee.wishlists
  end

  def update
    id = params[:id]
    Wishlist.update(id, wishlist_params[:wishlist])
    redirect_to "/wishlists/#{id}"
  end

  def destroy
    id = params[:id]
    Wishlist.destroy(id)
    redirect_to wishlists_path
  end

  private

  def wishlist_params
    params.permit(wishlist:[:item, :price, :bought])
  end

end
