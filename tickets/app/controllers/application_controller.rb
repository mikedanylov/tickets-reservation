class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :logged_in?, :current_user

  def logged_in?
    session[:user_id] # nil is false
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
