require 'spec_helper'

describe UserSessionsController do
  setup :activate_authlogic
  
  describe "#new" do
    it "requires user be logged out" do
      login(Factory.create :user)
      get :new
      response.should redirect_to logout_url
    end
  end
  describe "#create" do
    it "requires user be logged out" do
      login(Factory.create :user)
      post :create
      response.should redirect_to logout_url
    end
  end
  describe "#destroy" do
    it "fails when user is not logged in" do
      delete :destroy
      response.should redirect_to login_url
    end
  end
end
