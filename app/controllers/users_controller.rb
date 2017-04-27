class UsersController < ApplicationController

  def index
    @user = User.all
    @current_user = User.find_by_id(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

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

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/"
  end

end
