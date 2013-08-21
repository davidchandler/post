class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
  	 # get a handle on the user. (username)
  	
  	 #@user = User.new(users_params)

  	 @user = User.new(user_params)

  	 # call 'authenticate' on that user. pass in the password.

  	 #if @user.save
  	if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You Have Registerd. Now, login!"
      redirect_to root_path

    # redirect_to root_path, notice: "Your post was created!"
     else
     render :new     #  just renders the template, not a redirect back to the new action
    end
  end
     
  def user_params
    params.require(:user).permit(:username, :password)
  end

end