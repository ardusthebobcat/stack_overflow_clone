class AnswersController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @answer = Answer.new
  end

  def create
    @post = Post.find(params[:post_id])
    temp_params = answer_params
    temp_params[:user_id] = session[:user_id]
    temp_params[:post_id] = @post.id
    @answer = Answer.new(temp_params)
    if @answer.save
      flash[:success] = "Thanks for submitting your answer #{current_user.full_name}!"
      redirect_to post_path(@post)
    else
      flash[:danger] = "There was a problem!"
      render :new
    end
  end

private
  def answer_params
    params.require(:answer).permit(:description, :post_id, :user_id)
  end
end
