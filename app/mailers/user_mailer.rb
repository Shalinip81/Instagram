class UserMailer < ApplicationMailer


  def welcome
    @greeting = "Hi"

    mail to: "nidhis@yopmail.com"
  end
end
