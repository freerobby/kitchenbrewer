require 'spec_helper'

describe User do
  it "should create a new instance given valid attributes" do
    Factory.create :user
  end
  
  it "requires email address" do
    lambda {
      Factory.create :user, :email => nil
    }.should raise_error ActiveRecord::RecordInvalid
  end
  
  describe "has_role?" do
    describe "ownership" do
      describe "nonowner" do
        before do
          @u1 = Factory.create :user
          @u2 = Factory.create :user
        end
        it "owner is non-nonowner" do
          @u1.has_role?(:nonowner, @u1).should == false
        end
        it "non-owner is nonowner" do
          @u2.has_role?(:nonowner, @u1).should == true
        end
      end
      describe "user" do
        before do
          @u1 = Factory.create :user
          @u2 = Factory.create :user
        end
        it "owns self" do
          @u1.has_role?(:owner, @u1).should == true
        end
        it "does not own others" do
          @u1.has_role?(:owner, @u2).should == false
        end
      end
      describe "recipe" do
        before do
          @u1 = Factory.create :user
          @u2 = Factory.create :user
          @recipe = Factory.create :recipe, :author => @u1
        end
        it "owner owns" do
          @u1.has_role?(:owner, @recipe).should == true
        end
        it "non-owner does not own" do
          @u2.has_role?(:owner, @recipe).should == false
        end
      end
      describe "brew and brewnotes" do
        before do
          @u1 = Factory.create :user
          @u2 = Factory.create :user
          @brew = Factory.create :brew, :user => @u1
          @brewnote = Factory.create :brewnote, :brew => @brew
        end
        it "owner owns brew" do
          @u1.has_role?(:owner, @brew).should == true
        end
        it "non-owner does not own brew" do
          @u2.has_role?(:owner, @brew).should == false
        end
        it "owner of brew owns brewnote" do
          @u1.has_role?(:owner, @brewnote).should == true
        end
        it "non-owner of brew does not own brewnote" do
          @u2.has_role?(:owner, @brewnote).should == false
        end
      end
    end
  end
  
  describe "nickname" do
    it "defaults to pre-@ portion of email address if not provided" do
      (Factory.create :user, :email => "robby@freerobby.com", :nickname => nil).nickname.should == "Robby"
    end
    it "removes numbers and post-numbers content from end of pre-@ portion" do
      (Factory.create :user, :email => "robwg353@aol.com", :nickname => nil).nickname.should == "Robwg"
      (Factory.create :user, :email => "USER2B@domain.com", :nickname => "").nickname.should == "User"
    end
    it "keeps only first name when guessing first.last@domain.com pattern" do
      (Factory.create :user, :email => "john.smith@gmail.com", :nickname => nil).nickname.should == "John"
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
