require 'spec_helper'

describe User do
  it "should create a new instance given valid attributes" do
    Factory.create :user
  end
  
  describe "nickname" do
    it "defaults to pre-@ portion of email address if not provided" do
      (Factory.create :user, :email => "user@domain.com", :nickname => nil).nickname.should == "user"
      (Factory.create :user, :email => "user2@domain.com", :nickname => "").nickname.should == "user2"
    end
    it "keeps specified nickname if provided" do
      (Factory.create :user, :email => "user@domain.com", :nickname => "Jeff").nickname.should == "Jeff"
    end
  end
  
  describe "#confirm_email!" do
    before do
      @user = Factory.create :user
    end
    it "confirms the user's email address" do
      @user.email_confirmed?.should == false
      @user.confirm_email!
      @user.reload.email_confirmed?.should == true
    end
    it "clears the perishable token" do
      @user.perishable_token.should_not be_nil
      @user.confirm_email!
      @user.reload.perishable_token.should be_nil
    end
  end
  
  describe "#unconfirm_email_if_email_changed" do
    before do
      @user = Factory.create :user
      @user.confirm_email!
      @user.email_confirmed?.should == true
    end
    it "unconfirms the email address when changed" do
      @user.update_attribute(:email, "bob@gmail.com")
      @user.reload.email_confirmed?.should == false
    end
    it "does nothing when email address unchanged" do
      @user.update_attribute(:nickname, "jeffrey")
      @user.reload.email_confirmed?.should == true
    end
  end
end
