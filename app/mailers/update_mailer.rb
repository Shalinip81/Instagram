class UpdateMailer < ApplicationMailer

  def update_email(user)
    @user = user
    mail(
      from: "test24mailer@gmail.com",
      to: @user.email,
      subject: 'Welcome to My Awesome Site')
  end
end
