class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :log_in, :log_out, :authorized?, :shake_count, :check_id
  before_action :authenticate_user!

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

  def check_id(user)
    return (user == @challenge.challenger || user == @challenge.witness || user == @challenge.acceptor)
  end

  protected

    def authenticate_user!
      redirect_to root_path unless logged_in?
    end

    def shake_count
      shakes = Handshake.where(challenge_id: @challenge.id).count
      return shakes
    end

    def have_already_shaken?(count)
      return count >= 2
    end

    # dwolla variables
    # ---------------------------
    # create an application token
    # APP_TOKEN = $dwolla.auths.client
    # all dwolla users in the application
    # DWOLLA_USERS = APP_TOKEN.get "customers"
    # witness org funding account location
    # root = APP_TOKEN.get "/"
    # bucket_location = root._links.account.href
    # bucket = APP_TOKEN.get "#{bucket_location}/funding-sources"
    # BUCKET_URL = bucket._embedded[:"funding-sources"][0][:"_links"][:"self"][:"href"]
    # witness org id
    # main = APP_TOKEN.get bucket_location
    # WITNESS_DWOLLA_ID = main.id

end
