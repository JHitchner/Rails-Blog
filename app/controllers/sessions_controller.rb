class SessionsController < ApplicationController

  def new
  end
#  If username entered is equal to the username entered under new session log_in
# user and redirect to their account. Else flash alert error and redirect to login page.
  def create
    @user = User.where(username: params[:session][:username]).first
    if @user.password == params[:session][:password]
      session[:user_id]=@user.id
      log_in @user
      puts "my sess = #{session[:user_id]}"
      redirect_to @user
    else
      flash[:alert] = "Invalid Username/Password. Please try again"
      redirect_to login_path
    end
  end
# When user signs out set the session id to nil and redirect user to Login Page.
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
