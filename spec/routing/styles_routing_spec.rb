require 'spec_helper'

describe StylesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/styles" }.should route_to(:controller => "styles", :action => "index")
    end

    it "neither recognizes nor generates #new" do
      { :get => "/styles/new" }.should_not be_routeable
    end

    it "neither recognizes nor generates #show" do
      { :get => "/styles/1" }.should_not be_routeable
    end

    it "neither recognizes nor generates #edit" do
      { :get => "/styles/1/edit" }.should_not be_routeable
    end

    it "neither recognizes nor generates #create" do
      { :post => "/styles" }.should_not be_routeable
    end

    it "neither recognizes nor generates #update" do
      { :put => "/styles/1" }.should_not be_routeable
    end

    it "neither recognizes nor generates #destroy" do
      { :delete => "/styles/1" }.should_not be_routeable
    end
  end
end
