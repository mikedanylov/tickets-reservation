class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    password = params[:user][:password]

    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      redirect_to login_path, alert: "Invalid email or password!"
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "You have been logged out"
  end
end
