require 'spec_helper'

describe RecipesController do
  setup :activate_authlogic
  
  before do
    @user = Factory.create :user
    login(@user)
  end
  
  describe "GET index" do
    it "returns all recipes in the database" do
      Factory.create :recipe, :author => @user
      Factory.create :recipe, :author => @user
      Factory.create :recipe
      get :index
      assigns[:recipes].count.should == 3
    end
  end

  describe "GET show" do
    it "returns requested recipe as @recipe" do
      r = Factory.create :recipe, :author => @user
      get :show, :id => r.id
      assigns[:recipe].should == r
    end
  end
  
  describe "GET new" do
    before do
      get :new
    end
    it "returns a new recipe" do
      assigns[:recipe].should_not be_nil
    end
  end
  
  describe "GET edit" do
    before do
      @recipe = Factory.create :recipe, :author => @user, :style => (Factory.create :style), :brew_type => (Factory.create :brew_type)
      get :edit, :id => @recipe.id
    end
    it "returns requested recipe as @recipe" do
      assigns[:recipe].should == @recipe
    end
  end
  
  describe "POST create" do
    before do
      @params = Factory.attributes_for :recipe, :author => @user, :style => (Factory.create :style), :brew_type => (Factory.create :brew_type)
    end
    describe "with valid params" do
      before do
        post :create, :recipe => @params
      end
      it "assigns a newly created recipe as @recipe" do
        assigns[:recipe].should be_valid
      end
      it "redirects to the created recipe" do
        response.should redirect_to(edit_recipe_path(assigns[:recipe]))
      end
    end
    describe "with invalid params" do
      before do
        post :create, :recipe => @params.merge(:title => nil)
      end
      it "assigns a newly created, invalid, unsaved recipe as @recipe" do
        assigns[:recipe].should_not be_nil
        assigns[:recipe].should_not be_valid
      end
      it "re-renders the 'new' template" do
        response.should render_template('new')
      end
    end
  end
    
  describe "PUT update" do
    before do
      @recipe = Factory.create :recipe, :author => @user, :style => (Factory.create :style), :brew_type => (Factory.create :brew_type)
    end
    describe "with valid params" do
      before do
        put :update, :id => @recipe.id, :recipe => {:original_gravity => 1.051}
      end
      it "updates the requested recipe" do
        @recipe.reload.original_gravity.should == 1.051
      end
      it "assigns the requested recipe as @recipe" do
        assigns[:recipe].should == @recipe
      end
      it "shows the recipe" do
        response.should redirect_to(recipe_path(@recipe))
      end
    end
  
    describe "with invalid params" do
      before do
        put :update, :id => @recipe.id, :recipe => {:original_gravity => "string", :ibus => 5}
      end
      it "updates the rest of the recipe" do
        @recipe.reload.ibus.should == 5
      end
      it "assigns the recipe as @recipe" do
        assigns[:recipe].should == @recipe
      end
      it "shows the recipe" do
        response.should redirect_to(recipe_path(@recipe))
      end
    end
  end
  
  describe "DELETE destroy" do
    before do
      @recipe = Factory.create :recipe, :author => @user, :style => (Factory.create :style), :brew_type => (Factory.create :brew_type)
      delete :destroy, :id => @recipe.id
    end
    it "deletes the object" do
      lambda {
        @recipe.reload
      }.should raise_error ActiveRecord::RecordNotFound
    end
    it "redirects to index" do
      response.should redirect_to recipes_path
    end
  end
end
