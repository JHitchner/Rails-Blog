class HomeController < ApplicationController
  def index
    @user= User.all
    @post = Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
