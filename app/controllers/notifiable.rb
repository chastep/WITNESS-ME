module Notifiable

  def notify(challenge, path)
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

    message_1 = client.messages.create from: '980-272-5310', to: "#{challenge.acceptor.phone}", body: "#{challenge.challenger.username.upcase} has challenged you to the following: #{challenge.description}. Go to WITNESS-ME to play! https://witness-me.herokuapp.com"

    message_2 = client.messages.create from: '980-272-5310', to: "#{challenge.witness.phone}", body: "#{challenge.challenger.username.upcase} has invited you to witness the following: #{challenge.description}. Go to WITNESS-ME to be a witness! https://witness-me.herokuapp.com"
  end

end
