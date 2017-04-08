class Challenge < ApplicationRecord

  def generate_transfer_request(funding_source_id, recipient_url, value, customer_id)
    {
      :_links => {
        :source => {
          :href => "https://api-sandbox.dwolla.com/funding-sources/" + funding_source_id
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
