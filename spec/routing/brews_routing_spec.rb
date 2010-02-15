require 'spec_helper'

describe BrewsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/brews" }.should route_to(:controller => "brews", :action => "index")
    end

    it "neither recognizes nor generates #new" do
      { :get => "/brews/new" }.should_not be_routeable
    end

    it "recognizes and generates #show" do
      { :get => "/brews/1" }.should route_to(:controller => "brews", :action => "show", :id => "1")
    end

    it "neithr recognizes nor generates #edit" do
      { :get => "/brews/1/edit" }.should_not be_routeable
    end

    it "recognizes and generates #create" do
      { :post => "/brews" }.should route_to(:controller => "brews", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/brews/1" }.should route_to(:controller => "brews", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/brews/1" }.should route_to(:controller => "brews", :action => "destroy", :id => "1")
    end
    
    it "recognizes and generates #create_note" do
      { :post => "/brews/1/create_note" }.should route_to(:controller => "brews", :action => "create_note", :id => "1")
    end
  end
end
