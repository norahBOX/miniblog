class HomeController < ApplicationController

  def index
    @posts = Post.all 
    @users = User.all
  end

end