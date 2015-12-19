class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    password = params[:user][:password]

    if user && user.authenticate(password)
      session[:user_id] = user.id
      flash.notice = "Logged in successfully!"
      redirect_to root_path
    else
      flash.alert = "Invalid email or password!"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash.notice = "You have been logged out"
    redirect_to root_path
  end
end
