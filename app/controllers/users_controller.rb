class UsersController < ApplicationController 

  def index 

  end 

  def new 
    @user = User.new 
  end 

  def create 
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to user_steps_path
    else
      render :new
    end
  end

  private 

  def user_params 
    params.require(:user).permit(:bio, :date_of_birth, :email, :github_username, :name, :password, :password_confirmation, :twitter_username, :website)
  end

end