class User < ActiveRecord::Base
  acts_as_authentic
  before_save :guess_nickname_if_blank
  
  private
  def guess_nickname_if_blank
    self.nickname = self.email.gsub(/@.*/, "") if self.nickname.blank?
  end
end
