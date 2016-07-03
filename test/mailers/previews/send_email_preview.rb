# Preview all emails at http://localhost:3000/rails/mailers/send_email
class SendEmailPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/send_email/welcome_email
  def welcome_email
    SendEmail.welcome_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/send_email/forget_password
  def forget_password
    SendEmail.forget_password
  end

end
