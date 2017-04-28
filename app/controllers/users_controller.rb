class UsersController < ApplicationController

  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end

  def index
    @user = User.all
    # @current_user = User.find_by_id(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.new(params[:user])
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to SoapBox"
      session[:user_id] = @user.id
      redirect_to @user
      puts "the current session is #{session[:user_id]}"
    else
      flash[:alert] = "Oops! Something went wrong. Try again!"
      redirect_to new_user_path
    end
  end


  def show
    @user = User.find(params[:id])
    @post = @user.posts
    puts "this is current user #{session[:user_id]}"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
