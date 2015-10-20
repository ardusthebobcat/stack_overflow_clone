class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.full_name}!"
      redirect_to "/"
    else
      flash[:danger] = "There was a problem creating your account."
      redirect_to :back
    end
  end

  def show
    if session[:user_id]
      @user = User.find(current_user.id)
    else
      flash[:danger] = "You must be logged in!"
      redirect_to '/'
    end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
