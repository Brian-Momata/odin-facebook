class UserWelcomeMailer < ApplicationMailer
  default from: 'notification@example.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: "Account Created. Brian says 'Thank You & Enjoy'")
  end
end
