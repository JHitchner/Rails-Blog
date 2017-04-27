module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  # sets current user
  def current_user
     @current_user ||= User.find_by(id: session[:user_id])
   end
  #Checks to see if current user is logged in- for links
  def logged_in
    !current_user.nil?
  end

  def log_out(user)
    @current_user = nil
  end
end
