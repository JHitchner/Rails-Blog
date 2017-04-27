class CommentsController < ApplicationController

  def index
    @comments = Comment.find(params[:id])
  end

  def new
    @comments = Comment.new
  end

  def create
    @comments = Comment.create()
  end

  def destroy
    @comments = Comment.find(params[:id])
    @comments.destroy
    redirect_to post_comment_path
  end
end
