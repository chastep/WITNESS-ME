class ChallengesController < ApplicationController

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.challenger_id = current_user.id
    # @challenge.acceptor_id = User.find_by(username: params[:acceptor_id])
    # @challenge.witness_id = User.find_by(username: params[:witness_id])
    if @challenge.save
      redirect_to handshake_path(@challenge)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    render 'show'
  end

  def edit
    @challenge = Challenge.find_by(id: params[:id])
    @challenger = User.find_by(id: @challenge.challenger_id)
    @acceptor = User.find_by(id: @challenge.acceptor_id)
    @witness = User.find_by(id: @challenge.witness_id)
  end

  def update
    @challenge = Challenge.find_by(id: params[:id])
    @winner = User.find_by(id: @challenge.winner_id)
    app_token = $dwolla.auths.client
    bucket = app_token.get "/"
    @bucket_url = bucket._links.account.href
    transfer_request = @challenge.generate_transfer_request(@winner, @bucket_url)
    transfer = app_token.post "transfers", transfer_request
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
