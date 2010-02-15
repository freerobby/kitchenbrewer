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
    end
  end
  describe "with at least one brew" do
    before do
      assigns[:brews] = [Factory.build :brew]
    end
    it "lists existing brews" do
    end
    it "renders new brew form" do
    end
  end
end
