class Challenge < ApplicationRecord

  belongs_to :challenger, class_name: "User", foreign_key: "challenger_id"
  belongs_to :acceptor, class_name: "User", foreign_key: "acceptor_id"
  belongs_to :witness, class_name: "User", foreign_key: "witness_id"
  belongs_to :winner, class_name: "User", foreign_key: "winner_id"
  has_many :handshakes

  validates_presence_of :description, :price, :challenger_id, :acceptor_id
  validates_uniqueness_of :challenger_id, scope: [:acceptor_id, :witness_id]

  def generate_transfer_request(sender_url, recipient_url, value, customer_id)
    {
      :_links => {
        :source => {
          :href => sender_url
        },
        :destination => {
          :href => recipient_url
        }
      },
      :amount => {
        :currency => "USD",
        :value => "#{value}"
      },
      :metadata => {
        :customerId => customer_id,
        :notes => "transfer initiated"
      }
    }
  end

end
