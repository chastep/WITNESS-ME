class User < ApplicationRecord
  has_secure_password

  has_many :witnessed_challenges, class_name: "Challenge", foreign_key: "witness_id"
  has_many :challenged_challenges, class_name: "Challenge", foreign_key: "challenger_id"
  has_many :accepted_challenges, class_name: "Challenge", foreign_key: "acceptor_id"
  has_many :won_challenges, class_name: "Challenge", foreign_key: "winner_id"
  has_many :lost_challenges, class_name: "Challenge", foreign_key: "loser_id"
  has_many :handshakes

  validates_presence_of :first_name, :last_name, :email, :phone, :username
  validates_uniqueness_of :email, :username

  has_attached_file :profile_picture, styles: { medium: "150x150>", thumb: "75x75>" }
  # validates_attachment :profile_picture, :presence => true, styles: { medium: "150x150>", thumb: "75x75>" }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/

  def full_name
    @full_name
  end

  def show_full_name
    self.first_name + " " + self.last_name
  end

  def split_name(full_name)
    self.first_name = full_name.split(" ")[0]
    if self.last_name = full_name.split(" ")[1]

    else
      self.last_name = "Smith"
    end
  end

  def all_challenges
    self.witnessed_challenges + self.challenged_challenges + self.accepted_challenges
  end

  def pending_challenges
    personal_challenges = self.all_challenges
    pending = personal_challenges.select { |challenge| challenge.winner_id == nil && challenge.loser_id == nil }
    return pending
  end

  def completed_challenges
    personal_challenges = self.all_challenges
    completed = personal_challenges.select { |challenge| challenge.winner_id != nil && challenge.loser_id != nil }
    return completed
  end

  def has_shook?(challenge)
    # return true if challenger user has already created a handshake for that challenge, false otherwise
    shake = Handshake.where(challenge_id: challenge.id, user_id: self.id)
    if shake.empty?
      return false
    else
      return true
    end
  end

  def can_challenge?
    self.dwolla_url.include? "funding"
  end

  def customer_request_body
    {
      :firstName => self.first_name,
      :lastName => self.last_name,
      :email => self.email
    }
  end

end
