class UsersController < ApplicationController

  def new
    if logged_in?
      return redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def show
    return redirect_to new_user_path if !logged_in?
    @user = User.find_by(id: current_user.id)
    return redirect_to user_path(@user) if !authorized?(params[:id])
  end

  def create
    # create base user with info
    @user = User.new(user_params)
    @user.split_name(params[:user][:full_name])
    # create dwolla customer account and id
    request_body = @user.customer_request_body
    customer = APP_TOKEN.post "customers", request_body
    @user.dwolla_url = customer.headers[:location]
    @user.dwolla_id = DWOLLA_USERS._embedded.customers[0].id
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    return redirect_to new_user_path if !logged_in?
    @user = User.find_by(id: params[:id])
    if @user.id != session[:user_id]
      render 'shared/_404'
    else
      customer_url = @user.dwolla_url
      customer = APP_TOKEN.post "#{customer_url}/iav-token"
      @token = customer.token
    end
  end

  def update
    return redirect_to new_user_path if !logged_in?
    @user = User.find_by(id: params[:id])
    if @user.id != session[:user_id]
      render 'shared/_404'
    else
      if request.xhr?
        res = params[:user][:dwolla_url][:_links][:"funding-source"][:href]
        @user.update_attributes(dwolla_url: res)
        @user.dwolla_url
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone, :username, :dwolla_url, :profile_picture)
    end

end
