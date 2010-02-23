require 'spec_helper'

describe "/ingredients/index.js.erb" do
  describe "without any ingredients" do
    before do
      malt = Factory.build :style, :title => "Malt"
      hops = Factory.build :style, :title => "Hops"
      yeast = Factory.build :style, :title => "Yeast"
      assigns[:ingredients] = [malt, hops, yeast]
    end
    it "renders matches" do
      render
      response.body.should have_tag("ul")
      response.body.should have_tag("li", :text => "Malt")
      response.body.should have_tag("li", :text => "Hops")
      response.body.should have_tag("li", :text => "Yeast")
    end
  end
end
