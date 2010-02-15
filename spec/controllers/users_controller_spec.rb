require 'spec_helper'

describe UsersController do
  setup :activate_authlogic
  
  describe "GET confirm" do
    before do
      @user = Factory.create :user, :email => "user@domain.com"
    end
    describe "with valid token" do
      before do
        @user.email_confirmed?.should == false
        get :confirm, :id => @user.id, :token => @user.perishable_token
      end
      it "confirms the user's email address" do
        @user.reload.email_confirmed?.should == true
      end
      it "clears the perishable token" do
        @user.reload.perishable_token.should be_nil
      end
    end
    describe "with invalid token" do
      before do
        @user.email_confirmed?.should == false
        get :confirm, :id => @user.id, :token => "badtoken"
      end
      it "does not confirm the user's email address" do
        @user.reload.email_confirmed?.should == false
      end
      it "does not clear the user's valid perishable token" do
        @user.reload.perishable_token.should_not be_nil
      end
    end
  end

  describe "GET show" do
    before do
      @user1 = Factory.create :user
      @user2 = Factory.create :user
      login(@user1)
    end
    it "assigns the requested user as @user" do
      get :show, :id => @user2.id
      assigns[:user].should == @user2
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      assigns[:user].should_not be_nil
    end
  end
  
  describe "GET edit" do
    before do
      @user = Factory.create :user
      login(@user)
    end
    it "assigns the requested user as @user" do
      get :edit, :id => @user.id
      assigns[:user].should == @user
    end
  end

  describe "POST create" do
  
    describe "with valid params" do
      before do
        params = Factory.attributes_for :user
        post :create, :user => params
      end
      it "assigns a newly created user as @user" do
        assigns[:user].should be_valid
      end
      it "redirects to the created user" do
        response.should redirect_to(user_path(assigns[:user]))
      end
    end
  
    describe "with invalid params" do
      before do
        params = Factory.attributes_for :user, :email => "invalidemail"
        post :create, :user => params
      end
      it "assigns a newly created, invalid, unsaved user as @user" do
        assigns[:user].should_not be_nil
        assigns[:user].should_not be_valid
      end
      it "re-renders the 'new' template" do
        response.should render_template('new')
      end
    end
  
  end
  
  describe "PUT update" do
    before do
      @user = Factory.create :user
      login(@user)
    end
    describe "with valid params" do
      before do
        put :update, :id => @user.id, :user => {:nickname => "bob"}
      end
      it "updates the requested user" do
        @user.reload.nickname.should == "bob"
      end
      it "assigns the requested user as @user" do
        assigns[:user].should == @user
      end
      it "redirects to the user" do
        response.should redirect_to user_url(@user)
      end
    end
  
    describe "with invalid params" do
      before do
        put :update, :id => @user.id, :user => {:nickname => "bob", :email => "invalidemail"}
      end
      it "does not update the requested user" do
        @user.reload
        @user.nickname.should_not == "bob"
        @user.email.should_not == "invalidemail"
      end
      it "assigns the user as @user" do
        assigns[:user].should == @user
      end
      it "re-renders the 'edit' template" do
        response.should render_template('edit')
      end
    end
  
  end
end
