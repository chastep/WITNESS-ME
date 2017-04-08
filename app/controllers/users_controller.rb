class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    return redirect_to new_user_path if !logged_in?
    return redirect user_path(current_user.id) if !authorized?(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.split_name(params[:user][:full_name])
    app_token = $dwolla.auths.client
    request_body = @user.customer_request_body
    customer = app_token.post "customers", request_body
    @user.dwolla_url = customer.headers[:location]
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
  end

  def update
    @user = User.find_by(id: params[:id])
    customer_url = @user.dwolla_url
    request = @user.funding_request_body(params[:routing_number], params[:account_number], params[:type])
    app_token = $dwolla.auths.client
    funding_source = app_token.post "#{customer_url}/funding-sources", request
    @user.dwolla_url = funding_source.headers[:location]
    # p "--------------------------------------------"
    # p @user
    # p "--------------------------------------------"
    redirect_to user_path(@user)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone, :username, :routing_number, :account_number, :type)
    end

end
