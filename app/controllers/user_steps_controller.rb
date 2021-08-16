class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :social

  def show 
    @user = current_user 
    case step 
    when :personal
      @user
    end
    render_wizard
  end

  def update 
    @user = current_user 
    case step 
    when :social
      @user.update(user_params)
    end
    render_wizard @user
  end

  private 

  def user_params 
    params.require(:user).permit(:bio, :date_of_birth, :email, :github_username, :name, :password, :password_confirmation, :twitter_username, :website)
  end

  def finish_wizard_path
    flash[:notice] = "Thank you for signing up!"
    root_path(current_user)
  end

end
