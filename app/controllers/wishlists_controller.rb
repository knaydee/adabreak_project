class WishlistsController < ApplicationController
  before_action :only_owner

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
    wishlist_id = params[:id]
    @wishlist = Wishlist.find(wishlist_id)
    @action = "update"
    @title = "Edit an Item"
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

  def only_owner
      if !@current_user || @current_user.id != Giftee.find(params[:id]).user_id
        flash[:error] = "You are not authorized to view that section"
        redirect_to root_path
      end
  end

end
