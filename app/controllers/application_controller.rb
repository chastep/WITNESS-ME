class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :log_in, :log_out, :authorized?


  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    return nil if !logged_in?
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def log_in(user_id)
    session[:user_id] = user_id
    cookies.signed[:user_id] = user_id
  end

  def authorized?(integer_id)
    session[:user_id] == integer_id.to_i
  end

  protected

  def authenticate_user!
    redirect_to root_path unless logged_in?
  end
end
