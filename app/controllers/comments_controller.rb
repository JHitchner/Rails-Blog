class CommentsController < ApplicationController

  def index
    @comments = Comment.find(params[:id])
  end
  # Create a new Comment
  def new
    @comments = Comment.new
  end
  # Get the post ID and create a comment under that post.
  # Redirect to the post you commented on.
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end
  # Edit the comment. Find the post that the comment belogs to. Find the comment
  #  id of that post.
  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end
  # Update the comment you edited. If successful redirect back to post.
  # Else show the edit page again.
  def update
    @post = Post.find(params[:post_id])
    @comments = @post.comments.find(params[:id])
    if @comments.update(comment_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
# Delete Comment and redirect back to post.
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
   def comment_params
     params.require(:comment).permit(:commenter)
   end
end
