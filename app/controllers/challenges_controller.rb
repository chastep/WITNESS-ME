class ChallengesController < ApplicationController

  def new
    return redirect_to root_path if !authorized?(params[:user_id])
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.challeger_id = current_user.id
    if @user.save
      redirect_to challenge_path(@challenge)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
  end

  def destroy
    if @challenge.challenger_id == session[:user_id]
      @pairing.destroy
      redirect_to current_user
    else
      redirect_to root_path
    end
  end

  private
    def challenge_params
      params.require(:challenge).permit(:description, :price, :acceptor_id, :witness_id)
    end

end
