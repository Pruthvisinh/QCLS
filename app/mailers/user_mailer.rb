class UserMailer < ApplicationMailer
  default from: 'noreply@qcls.com'

  def welcome_email(user)
    @user = user
    @url  = root_url
    mail(to: @user.email, subject: 'Welcome to Our site')
  end
end
