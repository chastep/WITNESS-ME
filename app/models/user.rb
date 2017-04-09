class User < ApplicationRecord
  has_secure_password

  has_many :witnessed_challenges, class_name: "Challenge", foreign_key: "witness_id"
  has_many :challenged_challenges, class_name: "Challenge", foreign_key: "challenger_id"
  has_many :accepted_challenges, class_name: "Challenge", foreign_key: "acceptor_id"
  has_many :won_challenges, class_name: "Challenge", foreign_key: "winner_id"
  has_many :handshakes

  validates_presence_of :first_name, :last_name, :email, :phone, :username
  validates_uniqueness_of :email, :username

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

  def customer_request_body
    {
      :firstName => self.first_name,
      :lastName => self.last_name,
      :email => self.email
    }
  end

  def funding_request_body(routing_number, account_number, type)
    {
      :routingNumber => routing_number,
      :accountNumber => account_number,
      :type => type,
      :name => self.first_name + " " + self.last_name + " - "
    }
  end

end
