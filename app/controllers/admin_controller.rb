class AdminController < ApplicationController
  def index
    @admin = User.find(session[:user_id])
    if @admin.admin?
      @users = User.all
      @posts = Post.all
    else
      flash[:danger] = "You cannot view this page!"
      redirect_to '/'
    end
  end
end
