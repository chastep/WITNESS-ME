class UserMailer < ApplicationMailer
  default from: 'witness.me.app@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://witness-me.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Witness Me')
  end
end
