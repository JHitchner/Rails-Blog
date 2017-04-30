class CommentsController < ApplicationController

  def index
    @comments = Comment.find(params[:id])
  end

  def new
    @comments = Comment.new
  end


  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comments = @post.comments.find(params[:id])
    if @comments.update(comment_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
   def comment_params
     params.require(:comment).permit(:commenter, :body)
   end
end
