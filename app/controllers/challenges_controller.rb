class ChallengesController < ApplicationController

  def new
    @users = User.all
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.price = @challenge.price * 100
    @challenge.challenger_id = current_user.id
    @challenge.acceptor_id = User.find_by(username: params[:challenge][:acceptor]).id
    if params[:challenge][:witness] != ""
      @challenge.witness_id = User.find_by(username: params[:challenge][:witness]).id
    end
    if @challenge.save
      redirect_to handshake_path(@challenge)
    else
      @errors = @challenge.errors.full_messages
      render 'new'
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    # @challenger = User.find_by(id: @challenge.challenger_id)
    # @acceptor = User.find_by(id: @challenge.acceptor_id)
    # @witness = User.find_by(id: @challenge.witness_id)
    # @winner = User.find_by(id: @challenge.winner_id)
    render 'show'
  end

  def edit
    @challenge = Challenge.find_by(id: params[:id])
    # @challenger = User.find_by(id: @challenge.challenger_id)
    # @acceptor = User.find_by(id: @challenge.acceptor_id)
    # @witness = User.find_by(id: @challenge.witness_id)
  end

  def update
    @challenge = Challenge.find_by(id: params[:id])
    p "--------------------------------------------"
    p @challenge
    p "--------------------------------------------"
    @challenge.update_attributes(winner_id: params[:challenge][:winner_id], loser_id: params[:challenge][:loser_id])
    @challenge.save
    value = @challenge.price / 100
    # transfer for each user to the bucket
    # start with challenger
    @challenger = User.find_by(id: @challenge.challenger_id)
    # challenger_url = @challenger.dwolla_url
    # app_token = $dwolla.auths.client
    # bucket = app_token.get "/"
    # bucket_url = bucket._links.account.href
    challenger_transfer_request = @challenge.generate_transfer_request( @challenger.dwolla_url, $bucket_url, value, $witness_dwolla_id)
    # p "--------------------------------------"
    # p challenger_transfer_request
    # p "--------------------------------------"
    challenger_transfer_to_bucket = $app_token.post "transfers", challenger_transfer_request
    # -----------------------------------------------
    # acceptor tranfer to bucket
    @acceptor = User.find_by(id: @challenge.acceptor_id)
    acceptor_transfer_request = @challenge.generate_transfer_request(@acceptor.dwolla_url, $bucket_url, value, $witness_dwolla_id)
    acceptor_transfer_to_bucket = $app_token.post "transfers", acceptor_transfer_request
    # -----------------------------------------------
    # transfer fromt the witness bucket to the winner
    @winner = User.find_by(id: @challenge.winner_id)
    pot = (@challenge.price * 2) / 100
    # p pot
    # app_token = $dwolla.auths.client
    # bucket = app_token.get "/"
    # bucket_url = bucket._links.account.href
    winner_transfer_request = @challenge.generate_transfer_request($bucket_url, @winner.dwolla_url, pot, @winner.dwolla_id)
    winner_transfer = $app_token.post "transfers", winner_transfer_request
    # -----------------------------------------------
    render 'show'
  end

  def destroy
    @challenge = Challenge.find_by(id: params[:id])
    if @challenge.witness.id == session[:user_id]
      @challenge.destroy
      redirect_to current_user
    else
      @errors = ["Only the witness can cancel a challenge"]
      render "edit"
    end
  end

  private
    def challenge_params
      params.require(:challenge).permit(:description, :price)
    end

end
