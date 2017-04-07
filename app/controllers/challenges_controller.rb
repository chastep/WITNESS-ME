class ChallengesController < ApplicationController

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(description: params[:challenge][:description], price: params[:challenge][:price])
    @acceptor = User.find_by(username: params[:challenge][:acceptor_username])
    @challenge.acceptor_id = @acceptor.id
    @witness = User.find_by(username: params[:challenge][:witness_username])
    @challenge.witness_id = @witness.id
    @challenge.challenger_id = current_user.id
    if @challenge.save
      redirect_to challenge_path(@challenge)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    render 'show'
  end

  def destroy
    if @challenge.challenger_id == session[:user_id]
      @pairing.destroy
      redirect_to current_user
    else
      redirect_to root_path
    end
  end

  # private
  #   def challenge_params
  #     params.require(:challenge).permit(:description, :price)
  #   end

end
