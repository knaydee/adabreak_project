class AccountsController < ApplicationController

  # def sign_in
  #   @title = "Accounts Sign In"
  # end

  def index
    @accounts = Account.all
    @title = "My Accounts"
  end

  def show
    id = params[:id]
    @account = Account.find(id)
    @title = "#{@account.name} Info"
  end

  def new
    @account = Account.new()
    @action = "create"
    @title = "Add an Account"
  end

  def create
    Account.create(account_params[:account])
    redirect_to "/accounts"
  end

  private

  def account_params
    params.permit(account:[:name, :user_login])
  end
end
