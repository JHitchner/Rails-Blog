class UsersController < ApplicationController

  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end
  # Create new user. If saved successfully flash 'Welcome to SoapBox'. Set the current session
  # to user.id. Else flash error and redirect user to signUp again.
  def create
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
# Display Specific user information
  def show
    @user = User.find(params[:id])
    @post = @user.posts
  end
# Find specific user and delete account. Redirect to Home page.
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/"
  end

 # method that defines what the required parameters are for user.
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
