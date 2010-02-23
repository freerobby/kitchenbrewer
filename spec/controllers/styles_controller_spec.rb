require 'spec_helper'

describe StylesController do
  setup :activate_authlogic
  describe "GET index" do
    before do
      @pa = Factory.create :style, :title => "Pale Ale"
      @ipa = Factory.create :style, :title => "India Pale Ale"
      @stout = Factory.create :style, :title => "Stout"
    end
    it "returns all ingredients that match search" do
      get :index, :search => "pale"
      assigns[:styles].count.should == 2
      assigns[:styles].include?(@pa).should == true
      assigns[:styles].include?(@ipa).should == true
    end
  end
end
