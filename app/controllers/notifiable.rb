module Notifiable

  def notify(challenge, path)
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

    message = client.messages.create from: '980-272-5310', to: "#{challenge.acceptor.phone}", body: "#{challenge.challenger.username} has challenged you to the following: #{challenge.description}. Go to WITNESS-ME to play! http://murmuring-caverns-54973.herokuapp.com/#{path}"
  end

end
