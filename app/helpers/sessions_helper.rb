module SessionsHelper

  #log in user
  def log_in(current_user)
    session[:user_id] = current_user.id
    session[:user_name] = current_user.name
  end

  #find current_user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
