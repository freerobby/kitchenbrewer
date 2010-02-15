require 'spec_helper'

describe BrewnotesController do
  setup :activate_authlogic
  
  before do
    @user = Factory.create :user
    login(@user)
  end
  
  describe "GET edit" do
    before do
      @brew = Factory.create :brew, :user => @user
      @brewnote = Factory.create :brewnote, :brew => @brew
      get :edit, :id => @brewnote.id
    end
    it "assigns the brewnote as @brewnote" do
      assigns[:brewnote].should == @brewnote
    end
  end
  
  describe "PUT update" do
    before do
      @brew = Factory.create :brew, :user => @user
      @brewnote = Factory.create :brewnote, :brew => @brew
    end
    describe "with valid params" do
      before do
        put :update, :id => @brewnote.id, :brewnote => {:body => "My body!"}
      end
      it "updates the brewnote" do
        @brewnote.reload.body.should == "My body!"
      end
      it "assigns the brewnote as @brewnote" do
        assigns[:brewnote].should == @brewnote
      end
      it "redirects to the brew" do
        response.should redirect_to brew_url(@brew)
      end
    end
    describe "with invalid params" do
      before do
        put :update, :id => @brewnote.id, :brewnote => {:body => nil}
      end
      it "does not update the brewnote" do
        @brewnote.reload.body.should_not be_nil
      end
      it "assigns the brew as @brew" do
        assigns[:brewnote].should == @brewnote
      end
      it "redirects to the brew" do
        response.should render_template("edit")
      end
    end
  end
  
  describe "DELETE destroy" do
    before do
      @brew = Factory.create :brew, :user => @user
      @brewnote = Factory.create :brewnote, :brew => @brew
      delete :destroy, :id => @brew.id, :brewnote_id => @brewnote.id
    end
    it "deletes the object" do
      lambda {
        @brewnote.reload
      }.should raise_error ActiveRecord::RecordNotFound
    end
    it "redirects to index" do
      response.should redirect_to brew_path(@brew)
    end
    it "leaves brew object intact" do
      lambda {
        @brew.reload
      }.should_not raise_error
      @brew.should_not be_nil
    end
  end
  
end
