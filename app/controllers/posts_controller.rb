class PostsController < ApplicationController

 # Grab all Post
  def index
    @posts = Post.all
  end
# Find ampost by id
  def show
    @post = Post.find(params[:id])
  end
# Create new post
  def new
    @post = Post.new
  end
  # If creation successful redirect to the user's account else render "New".
  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    if @post.save
      redirect_to user_path(session[:user_id])
    else
     render 'new'
    end
  end
# Find pot to edit by id.
  def edit
    @post = Post.find(params[:id])
  end
# Update the post information. If successful redirect user to User Account else
# render the edit page.
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(session[:user_id])
    else
      render 'edit'
    end
  end
# Find post by ID and delete. Redirect to the posts show page.
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(session[:user_id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
