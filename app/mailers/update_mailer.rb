class UpdateMailer < ApplicationMailer

  def upemail(user)
    @user = user
    mail(
      from: "test24mailer@gmail.com",
      to: @user.email,
      subject: 'Welcome to My Awesome Site')
  end
end
