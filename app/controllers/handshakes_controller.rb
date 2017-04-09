class HandshakesController < ApplicationController
  def create


  end
  def show

  end

  private
    def reroute
    end

    def check_id(user)
      return (user == @challenge.challenger || user == @challenge.witness || user == @challenge.acceptor)
    end
end
