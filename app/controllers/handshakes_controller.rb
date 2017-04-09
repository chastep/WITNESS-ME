class HandshakesController < ApplicationController
  def create


  end
  def show
    @challenge = Challenge.find(params[:id])
    @challenger = @challenge.challenger
    @acceptor = @challenge.acceptor
  end

  private
    def reroute
    end

    def check_id(user)
      return (user == @challenge.challenger || user == @challenge.witness || user == @challenge.acceptor)
    end
end
