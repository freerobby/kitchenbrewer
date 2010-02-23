require 'spec_helper'

describe "/styles/index.js.erb" do
  describe "without any styles" do
    before do
      pa = Factory.build :style, :title => "Pale Ale"
      ipa = Factory.build :style, :title => "India Pale Ale"
      stout = Factory.build :style, :title => "Stout"
      assigns[:styles] = [pa, ipa, stout]
    end
    it "renders matches" do
      render
      response.body.should have_tag("ul")
      response.body.should have_tag("li", :text => "Pale Ale")
      response.body.should have_tag("li", :text => "India Pale Ale")
      response.body.should have_tag("li", :text => "Stout")
    end
  end
end
