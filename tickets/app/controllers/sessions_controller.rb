class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    password = params[:user][:password]

    if user && user.authenticate(password)
      session[:user_id] = user.id
      flash.notice = "Logged in successfully!"
      if user.is_admin
        redirect_to admin_path
      else
        redirect_to root_path
      end
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
