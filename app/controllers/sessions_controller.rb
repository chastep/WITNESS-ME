class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to user_path
    else
      @errors = ["Invalid email/password"]
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
