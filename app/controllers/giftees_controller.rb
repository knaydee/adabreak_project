class GifteesController < ApplicationController

  # def sign_in
  #   @title = "Accounts Sign In"
  # end

  def index
    @giftees = Giftee.all
    @title = "My Giftees"
  end

  def show
    id = params[:id]
    @giftee = Giftee.find(id)
    @title = "#{@giftee.name}'s Info"
    @wishlist = @giftee.wishlists
  end

  def new
    @giftee = Giftee.new()
    @action = "create"
    @title = "Add Giftee"
  end

  def create
    Giftee.create(account_params[:giftee])
    redirect_to "/giftees"
  end

  def edit
    id = params[:id]
    @giftee = Giftee.find(id)
    @action = "update"
    @title = "Edit a Giftee"
  end

  def update
    id = params[:id]
    Giftee.update(id, account_params[:giftee])
    redirect_to "/giftees/#{id}"
  end

  def destroy
    id = params[:id]
    Giftee.destroy(id)
    redirect_to giftees_path
  end

  private

  def account_params
    params.permit(giftee:[:name, :age, :likes, :dislikes])
  end
end
