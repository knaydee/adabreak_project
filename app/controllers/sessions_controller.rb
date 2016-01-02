class SessionsController < ApplicationController
  def new
  end

  def create
    data = params[:session_data]
    @user = User.find_by_email_address(data[:email_address])

    if !@user.nil?
      if @user.authenticate(data[:password])
        session[:user_id] = @user.id
        flash[:notice] = "Welcome, #{@user.username}!"
        redirect_to root_path
      else
        flash.now[:error] = "Your email was not found or password did not match. Please try again."
        render :new
      end
    else
      flash.now[:error] = "Your email was not found or password did not match. Please try again or sign up to create a new user."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
