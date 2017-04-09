class HandshakesChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber of this channel.
  def subscribed
    challenge = Challenge.find_by(id: params[:room])
    stream_for challenge
  end

  def receive(payload)
    handshake = Handshakes.create(challenge_id: challenge.id, user_id: current_user.id)
  end
end
