class WelcomeLocalUserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(
      to: user.email,
      subject: "Welcome to GiveALittle, #{user.first_name}!"
    )
  end
end
