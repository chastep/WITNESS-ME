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
    p "----------------------------------------"
    p @user
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :phone, :username)
  end

end
