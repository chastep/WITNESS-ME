class Challenge < ApplicationRecord

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
