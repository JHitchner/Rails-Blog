class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.where(username: params[:session][:username]).first
    if @user.password == params[:session][:password]
      session[:user_id]=@user.id
      log_in @user
      redirect_to @user
    else
      flash[:alert] = "Invalid Username/Password. Please try again"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
