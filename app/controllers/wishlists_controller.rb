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
    @wishlist = Wishlist.new()
    @action = "create"
    @title = "Add Item"
  end

  def create
    Wishlist.create(account_params[:wishlist])
    redirect_to "/wishlists"
  end

  def edit
    id = params[:giftee_id]
    @giftee = Giftee.find(id)
    @action = "update"
    @title = "Edit an Item"
    @wishlist = @giftee.wishlists
  end

  def update
    id = params[:id]
    Wishlist.update(id, account_params[:wishlist])
    redirect_to "/wishlists/#{id}"
  end

  def destroy
    id = params[:id]
    Wishlist.destroy(id)
    redirect_to wishlists_path
  end

  private

  def account_params
    params.permit(wishtlist:[:item, :price, :bought])
  end

end
