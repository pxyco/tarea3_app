class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.share_calories.subject
  #
  def share_calories(email, user)
    @user = user
    @greeting = "Hi"

    mail to: email, subject: "Calories data"
  end
end
