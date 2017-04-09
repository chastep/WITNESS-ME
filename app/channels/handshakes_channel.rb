class HandshakesChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber of this channel.
  def subscribed
    stream_from "challenge-#{params[:room]}:handshake"
  end

  def receive(payload)
    Handshake.create!(user_id: current_user.id, challenge_id: payload["message"])
  end
end
