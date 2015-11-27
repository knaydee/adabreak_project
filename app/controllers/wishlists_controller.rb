class WishlistsController < ApplicationController

  def index
    id = params[:giftee_id]
    @giftee = Giftee.find(id)
    @title = "#{@giftee.name}'s Wishlist"
    @wishlists = @giftee.wishlists
  end

  def show
    id = params[:giftee_id]
    @giftee = Giftee.find(id)
    @title = "Market Vendors"
    @wishlists = @giftee.wishlists
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
    id = params[:id]
    @giftee = Giftee.find(id)
    @action = "update"
    @title = "Edit an Item"
    @wishlists = @giftee.wishlists
    @wishlist = Wishlist.find(id)
  end

  def update
    id = params[:id]
    Wishlist.update(id, wishlist_params[:wishlist])
    redirect_to giftee_wishlists_path
  end

  def destroy
    id = params[:id]
    Wishlist.destroy(id)
    redirect_to giftee_wishlists_path
  end

  private

  def wishlist_params
    params.permit(wishlist:[:item, :price, :bought])
  end

end
