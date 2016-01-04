class GifteesController < ApplicationController
  before_action :only_owner, only: [:edit, :update, :show, :destroy]
  before_action :require_login, only: [:index, :new, :create] 


  def index
    @giftees = @current_user.giftees
    @title = "My Giftees"
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
    giftee = Giftee.create(giftee_params[:giftee])
    giftee.user_id = session[:user_id]
    giftee.save
    redirect_to user_path(@current_user)
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

  def only_owner
      if !@current_user || @current_user.id != Giftee.find(params[:id]).user_id
        flash[:error] = "You are not authorized to view that section"
        redirect_to root_path
      end
  end

end
