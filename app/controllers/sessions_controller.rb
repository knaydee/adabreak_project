class SessionsController < ApplicationController
  def new
  end

  def create
    data = params[:session_data]
    @user = User.find_by_email(data[:email])

    if !@user.nil?
      if @user.authenticate(data[:password])
        session[:user_id] = @user.id
        flash[:notice] = "Welcome, #{@user.name}!"
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
    session[:user_id] = nil if session[:user_id]
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
