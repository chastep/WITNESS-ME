class Challenge < ApplicationRecord

  def generate_transfer_request(winner, bucket_url)
    source_url = bucket_url
    destination_url = winner.dwolla_url
    value = (self.price.to_s.to_i * 2) / 100
    {
      :_links => {
        :source => {
          :href => source_url
        },
        :destination => {
          :href => destination_url
        }
      },
      :amount => {
        :currency => "USD",
        :value => value
      },
      :metadata => {
        :customerId => winner.dwolla_id,
        :notes => "For winning the challenge."
      }
    }
  end

end
