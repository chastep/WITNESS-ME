module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    return nil if !logged_in?
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def authorized?(integer_id)
    session[:user_id] == integer_id.to_i
  end
end
