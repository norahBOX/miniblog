class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %I[new create edit update destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:body))
    @comment.user = current_user 
    @comment.save

    redirect_to user_post_path(@post.user, @post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to user_post_path(@post.user, @post)
  end

end