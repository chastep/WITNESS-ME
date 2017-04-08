class HandshakesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'handshakes'
  end

  def receive(payload)
    handshake = Handshakes.create(challenge_id: payload["challenge_id"] user_id: current_user.id)
  end
end
