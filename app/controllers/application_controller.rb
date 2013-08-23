class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?  # makes the current_user and logged_in? methods available user wide.

  def require_user
    unless logged_in?
      flash[:error] = "Must be logged in to do that."
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
   # User.find(session[:user_id])  if session[:user_id]
  end

  def logged_in?  # If logged_in > have access to current user object.
    !!current_user   # returns a boolean.
  end

  def access_denied
    flash[:error] = "You can't do that"
    redirect_to root_path
  end
end
