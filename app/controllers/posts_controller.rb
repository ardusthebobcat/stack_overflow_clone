class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    temp_params = post_params
    temp_params[:user_id] = session[:user_id]
    @post = Post.new(temp_params)
    if @post.save
      flash[:success] = "Thanks for submitting your post"
      redirect_to "/"
    else
      flash[:danger] = "There was a problem!"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

private
  def post_params
    params.require(:post).permit(:question, :description, :user_id)
  end
end
