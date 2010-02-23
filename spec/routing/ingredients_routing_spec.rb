require 'spec_helper'

describe IngredientsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/ingredients" }.should route_to(:controller => "ingredients", :action => "index")
    end

    it "neither recognizes nor generates #new" do
      { :get => "/ingredients/new" }.should_not be_routeable
    end

    it "neither recognizes nor generates #show" do
      { :get => "/ingredients/1" }.should_not be_routeable
    end

    it "neither recognizes nor generates #edit" do
      { :get => "/ingredients/1/edit" }.should_not be_routeable
    end

    it "neither recognizes nor generates #create" do
      { :post => "/ingredients" }.should_not be_routeable
    end

    it "neither recognizes nor generates #update" do
      { :put => "/ingredients/1" }.should_not be_routeable
    end

    it "neither recognizes nor generates #destroy" do
      { :delete => "/ingredients/1" }.should_not be_routeable
    end
  end
end
