class HandshakesChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber of this channel.
  def subscribed
    stream_from "challenge-#{params[:room]}:handshake"
  end

  def receive(payload)
    if !!payload["message"]
      Handshake.create!(user_id: current_user.id, challenge_id: payload["message"])
    else
      ActionCable.server.broadcast "challenge-#{params[:room]}:handshake", message: who_joined(payload)
    end
  end

  def who_joined(payload)
    if payload['emailOfUser'] == current_user.email
      return "you joined"
    else
      return "your friend joined"
    end
  end
end
