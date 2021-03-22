class PostsController < ApplicationController
  before_action :authenticate_user!, only: %I[new create edit update destroy] 
  before_action :set_post_writer
  before_action :set_post, only: %I[show edit update destroy]

  def index
    @posts = @user.posts.last(5)
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = @user.posts.new(post_params)
    @post.save

    redirect_to user_post_path(@user.slug, @post)
  end


  def show

  end

  def edit
  end

  def update 
    @post.update(post_params)

    redirect_to user_post_path(@user.slug, @post)
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path
  end



  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def post_writer_params
    params[:user_slug]
  end

  def set_post_writer # 현 페이지 블로그 소유자
    @user = User.friendly.find(params[:user_slug])
  end

  def verify_user_own # 현 페이지 블로그 소유자가 로그인한 사람인가요?
    user_signed_in? && current_user.friendly_id == @user.friendly_id
  end

  def redirect_unverified_user
    unless verify_writer_own
      flash[:alert] = "팀만 이 스터디방에 글을 작성할 수 있습니다!"
      redirect_to root_path
    end
  end

end