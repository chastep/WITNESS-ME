module Notifiable

  def notify(challenge, path)
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

    message_1 = client.messages.create from: '980-272-5310', to: "#{challenge.acceptor.phone}", body: "#{challenge.challenger.username} has challenged you to the following: #{challenge.description}. Go to WITNESS-ME to play! http://murmuring-caverns-54973.herokuapp.com/#{path}"

    message_2 = client.messages.create from: '980-272-5310', to: "#{challenge.witness.phone}", body: "#{challenge.challenger.username} has invited you to witness the following: #{challenge.description}. Go to WITNESS-ME to be a witness! http://murmuring-caverns-54973.herokuapp.com/#{path}"
  end

end
