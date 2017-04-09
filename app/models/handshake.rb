class Handshake < ApplicationRecord

  belongs_to :challenge
  belongs_to :user

  after_create_commit {HandshakeJob.perform_now self}
end
