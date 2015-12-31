module SessionsHelper

  # login a given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # logs out given user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # returns current session user if logged in
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # returns true if user is logged in
  def logged_in?
    !current_user.nil?
  end

end
