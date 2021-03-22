class HomeController < ApplicationController

  def index
    @posts = Post.last(10)
    # @users = User.all
  end

end