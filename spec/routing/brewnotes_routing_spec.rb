require 'spec_helper'

describe BrewnotesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/brewnotes" }.should_not be_routeable
    end

    it "neither recognizes nor generates #new" do
      { :get => "/brewnotes/new" }.should_not be_routeable
    end

    it "recognizes and generates #show" do
      { :get => "/brewnotes/1" }.should_not be_routeable
    end

    it "neithr recognizes nor generates #edit" do
      { :get => "/brewnotes/1/edit" }.should route_to(:controller => "brewnotes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/brewnotes" }.should_not be_routeable
    end

    it "recognizes and generates #update" do
      { :put => "/brewnotes/1" }.should route_to(:controller => "brewnotes", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/brewnotes/1" }.should route_to(:controller => "brewnotes", :action => "destroy", :id => "1")
    end
  end
end
