class SendEmail < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_email.welcome_email.subject
  #
  def welcome_email(email)
    @email = email
   mail(to: email,from: "harmeetsingh301296@gmail.com",subject:"Welcome to CELL-STORE")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_email.forget_password.subject
  #
  def forget_password
    @email = email
    mail(to: email,from: "harmeet301296singh@gmail.com",subject:"Changing current password")
  end
end
