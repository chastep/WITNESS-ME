class HandshakesController < ApplicationController
  before_action :reroute?, only: [:show]

  def create
  end

  def show

  end

  private
    def reroute?
      @challenge = Challenge.find(params[:id])
      @challenger = @challenge.challenger
      @acceptor = @challenge.acceptor
      return redirect_to root_path if !check_id(current_user)
    end

    def check_id(user)
      return (user == @challenge.challenger || user == @challenge.witness || user == @challenge.acceptor)
    end
end
