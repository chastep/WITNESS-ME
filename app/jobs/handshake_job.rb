class HandshakeJob < ApplicationJob
  queue_as :default

  def perform(shake)
    ActionCable.server.broadcast "handshake", message: render_message(message)
  end

  private
    def render_message(shake)

    end
end
