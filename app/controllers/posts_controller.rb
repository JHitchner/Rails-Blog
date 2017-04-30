class PostsController < ApplicationController

  # before_action:

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    session[:user_id] = @post.user_id
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(session[:user_id])
    else
      render 'edit'
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    if @post.save
     redirect_to user_path(session[:user_id])
    else
     render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
