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
end
