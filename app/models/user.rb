class User < ActiveRecord::Base
  acts_as_authentic do |config|
    config.disable_perishable_token_maintenance true
  end
  
  has_many :brews
  
  before_save :guess_nickname_if_blank
  before_save :unconfirm_email_if_email_changed
  after_save :request_confirmation_if_email_changed
  
  def confirm_email!
    self.update_attributes(:email_confirmed => true, :perishable_token => nil)
  end

  private
  def guess_nickname_if_blank
    if self.nickname.blank?
      self.nickname = self.email.gsub(/@.*/, "")
      self.nickname.gsub!(/\..*/, "")
      self.nickname.downcase!
      self.nickname.capitalize!
    end
  end
  
  def unconfirm_email_if_email_changed
    if email_changed?
      self.email_confirmed = false 
      reset_perishable_token
      self.send(:update_without_callbacks) # There should be a better way, but anything else gives an infinite loop
    end
  end
  
  def request_confirmation_if_email_changed
    if email_changed?
      UserMailer.deliver_new_email_address_confirmation(self)
    end
  end
end
