require 'spec_helper'

describe IngredientsController do
  setup :activate_authlogic
  describe "GET index" do
    before do
      @baseball = Factory.create :ingredient, :title => "baseball"
      @basketball = Factory.create :ingredient, :title => "basektball"
      @socer = Factory.create :ingredient, :title => "soccer"
      @hockey = Factory.create :ingredient, :title => "hockey"
      @football = Factory.create :ingredient, :title => "football"
    end
    it "returns all ingredients that match search" do
      get :index, :search => "ball"
      assigns[:ingredients].count.should == 3
      assigns[:ingredients].include?(@baseball).should == true
      assigns[:ingredients].include?(@basketball).should == true
      assigns[:ingredients].include?(@football).should == true
    end
  end
end
