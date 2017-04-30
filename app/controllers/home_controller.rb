class HomeController < ApplicationController
  def index
    @user= User.all
    @post = Post.all
  end
end
