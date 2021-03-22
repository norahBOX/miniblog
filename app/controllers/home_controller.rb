class HomeController < ApplicationController

  def index
<<<<<<< Updated upstream
    @posts = Post.all 
    @users = User.all
=======
    @posts = Post.last(10)
>>>>>>> Stashed changes
  end

end