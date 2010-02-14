class UserMailer < ActionMailer::Base
  def new_email_address_confirmation(user)
    subject     "Please Confirm Your Email Address"
    from        "KitchenBrewer"
    recipients  user.email
    sent_on     Time.now
    body        :user => user
  end
end
