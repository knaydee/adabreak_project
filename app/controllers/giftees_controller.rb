class GifteesController < ApplicationController

  # def sign_in
  #   @title = "Accounts Sign In"
  # end

  def index
    @giftees = Giftee.all
    @title = "Giftee Profiles"
  end

  def show
    id = params[:id]
    @giftee = Giftee.find(id)
    @title = "#{@giftee.name}'s Info"
    @name = @giftee.name
  end

  def new
    @giftee = Giftee.new()
    @action = "create"
    @title = "Add a New Giftee"
  end

  def create
    Giftee.create(giftee_params[:giftee])
    redirect_to giftees_path
  end

  def edit
    id = params[:id]
    @giftee = Giftee.find(id)
    @action = "update"
    @title = "Edit a Giftee"
  end

  def update
    id = params[:id]
    Giftee.update(id, giftee_params[:giftee])
    redirect_to giftee_path(id)
  end

  def destroy
    id = params[:id]
    Giftee.destroy(id)
    redirect_to giftees_path
  end

  private

  def giftee_params
    params.permit(giftee:[:name, :age, :likes, :dislikes])
  end
end
