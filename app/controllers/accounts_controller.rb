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
end
