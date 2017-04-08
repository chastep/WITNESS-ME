class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    return redirect_to new_user_path if !logged_in?
    return redirect user_path(current_user.id) if !authorized?(params[:id])
  end

  def create
    # create base user with info
    @user = User.new(user_params)
    @user.split_name(params[:user][:full_name])
    # create dwolla customer account and id
    app_token = $dwolla.auths.client
    request_body = @user.customer_request_body
    customer = app_token.post "customers", request_body
    @user.dwolla_url = customer.headers[:location]
    users = app_token.get "customers"
    @user.dwolla_id = users._embedded.customers[0].id
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    app_token = $dwolla.auths.client
    customer_url = @user.dwolla_url
    customer = app_token.post "#{customer_url}/iav-token"
    @token = customer.token
  end

  def update
    @user = User.find_by(id: params[:id])
    if request.xhr?
      res = params[:user][:dwolla_url][:_links][:"funding-source"][:href]
      p "-----------------------------------------"
      p res
      # res[:_links][:"funding-source"][:href]
      # p res
      # @user.update_attributes(dwolla_url: )
    end
    # request = @user.funding_request_body(params[:routing_number], params[:account_number], params[:type])
    # app_token = $dwolla.auths.client
    # funding_source = app_token.post "#{customer_url}/funding-sources", request
    # @user.dwolla_url = funding_source.headers[:location]
    redirect_to user_path(@user)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone, :username, :dwolla_url)
    end

end
