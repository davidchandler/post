class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

  def new; end

  def create
    #user = User.where(username: params[:username]).first

    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  # saved to cookie
      flash[:notice] = "Welcome, you've logged in."
      redirect_to root_path
    else
      flash[:error] = "There is something wrong with your username or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil   #logged out. session is cleared when close browser
    flash[:notice] = "You've logged out."
    redirect_to root_path
  end

 # private

end
