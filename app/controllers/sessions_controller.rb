class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    p params
    if user && user.authenticate(params[:session][:password])
      log_in(user.id)
      redirect_to user_path(user)
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
