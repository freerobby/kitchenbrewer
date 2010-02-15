require 'spec_helper'

describe BrewsController do
  setup :activate_authlogic
  
  before do
    @user = Factory.create :user
    login(@user)
  end
  
  describe "GET index" do
    it "returns all brews owned by the current user" do
      Factory.create :brew, :user => @user
      Factory.create :brew, :user => @user
      get :index
      assigns[:brews].count.should == 2
    end
  end

  describe "GET show" do
    it "returns requested brew as @brew" do
      b = Factory.create :brew, :user => @user
      get :show, :id => b.id
      assigns[:brew].should == b
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before do
        params = Factory.attributes_for :brew, :user => @user
        post :create, :brew => params
      end
      it "assigns a newly created user as @user" do
        assigns[:brew].should be_valid
      end
      it "redirects to the created brew" do
        response.should redirect_to(brew_path(assigns[:brew]))
      end
    end
    describe "with invalid params" do
      before do
        params = Factory.attributes_for :brew, :intended_original_gravity => "string"
        post :create, :brew => params
      end
      it "assigns a newly created, invalid, unsaved user as @user" do
        assigns[:brew].should_not be_nil
        assigns[:brew].should_not be_valid
      end
      it "re-renders the 'index' template" do
        response.should render_template('index')
      end
    end
  end
  
  describe "POST create_note" do
    describe "with valid params" do
      before do
        @brew = Factory.create :brew, :user => @user
        params = Factory.attributes_for :brewnote, :brew => @brew
        @old_ct = Brewnote.count
        post :create_note, :id => @brew.id, :brewnote => params
      end
      it "creates the note" do
        Brewnote.count.should == @old_ct + 1
      end
      it "assigns the parent brew as @brew" do
        assigns[:brew].should == @brew
      end
      it "redirects to the parent brew" do
        response.should redirect_to(brew_path(@brew))
      end
    end
    describe "with invalid params" do
      before do
        @brew = Factory.create :brew, :user => @user
        params = Factory.attributes_for :brewnote, :brew => @brew, :body => nil
        @old_ct = Brewnote.count
        post :create_note, :id => @brew.id, :brewnote => params
      end
      it "does not create a note" do
        Brewnote.count.should == @old_ct
      end
      it "assigns the supplied brew as @brew again" do
        assigns[:brew].should == @brew
      end
      it "re-renders the show page" do
        response.should render_template("show")
      end
    end
  end
  
  describe "PUT update" do
    before do
      @brew = Factory.create :brew, :user => @user
    end
    describe "with valid params" do
      before do
        put :update, :id => @brew.id, :brew => {:actual_original_gravity => 1.051}
      end
      it "updates the requested brew" do
        @brew.reload.actual_original_gravity.should == 1.051
      end
      it "assigns the requested brew as @brew" do
        assigns[:brew].should == @brew
      end
      it "redirects to the brew" do
        response.should redirect_to brew_url(@brew)
      end
    end
  
    describe "with invalid params" do
      before do
        put :update, :id => @brew.id, :brew => {:actual_original_gravity => "string"}
      end
      it "does not update the requested brew" do
        @brew.reload
        @brew.actual_original_gravity.should_not == "string"
      end
      it "assigns the brew as @brew" do
        assigns[:brew].should == @brew
      end
      it "re-renders the 'edit' template" do
        response.should render_template('edit')
      end
    end
  end
  
  describe "DELETE destroy" do
    before do
      @brew = Factory.create :brew, :user => @user
      delete :destroy, :id => @brew.id
    end
    it "deletes the object" do
      lambda {
        @brew.reload
      }.should raise_error ActiveRecord::RecordNotFound
    end
    it "redirects to index" do
      response.should redirect_to brews_path
    end
  end
end
