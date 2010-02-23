require 'spec_helper'

describe "/brews/index.html.erb" do
  include BrewsHelper
  
  describe "without any brews" do
    before do
      assigns[:brews] = []
    end
    it "renders get started page" do
      render
      response.should include_text "Get Started"
    end
    it "renders new brew form" do
      render
      response.should have_tag("input[name=?]", "brew[recipe_title]")
    end
  end
  describe "with at least one brew" do
    before do
      b1 = Factory.create :brew, :recipe_title => "Stout"
      b2 = Factory.create :brew, :recipe_title => "Porter"
      assigns[:brews] = [b1, b2]
    end
    it "lists existing brews" do
      render
      response.should include_text "Stout"
      response.should include_text "Porter"
    end
    it "renders new brew form" do
      render
      response.should have_tag("input[name=?]", "brew[recipe_title]")
    end
  end
end
