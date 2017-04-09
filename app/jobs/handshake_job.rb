class HandshakeJob < ApplicationJob
  queue_as :default

  def perform(shake)
    ActionCable.server.broadcast "challenge-#{shake.challenge_id}:handshake", message: render_message(shake), handshakes: find_current_shakeys(shake)
  end

  private
    def render_message(shake)
      challenge = shake.challenge
      if challenge.challenger_id == shake.user_id
        return "&#x1F590;"
      elsif challenge.acceptor_id == shake.user_id
        return "&#x270B;"
      elsif challenge.witness_id == shake.user_id
        return "Hey Let Them Shake on It"
      end
    end

    def find_current_shakeys(shake)
      shakes = Handshake.where(challenge_id: shake.challenge_id).count
      return shakes
    end
end
