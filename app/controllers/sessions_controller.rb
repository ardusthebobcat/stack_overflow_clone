class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:success] = "Hello #{@user.full_name}!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:danger] = "There was a problem, try again!"
      redirect_to new_session_path
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    session[:user_id] = nil
    flash[:success] = "Good-bye #{@user.full_name}!"
    redirect_to "/"
  end
end
