class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://murmuring-caverns-54973.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Witness Me')
  end
end
