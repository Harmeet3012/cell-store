require 'test_helper'

class SendEmailTest < ActionMailer::TestCase
  test "welcome_email" do
    mail = SendEmail.welcome_email
    assert_equal "Welcome email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "forget_password" do
    mail = SendEmail.forget_password
    assert_equal "Forget password", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
