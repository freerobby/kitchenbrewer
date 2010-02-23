require 'spec_helper'

describe "/recipes/index.html.erb" do
  describe "Recipe Listing" do
    it "Lists all recipes" do
      r1 = Factory.create :recipe, :title => "Robby's Stout"
      r2 = Factory.create :recipe, :title => "Mike's Porter"
      assigns[:recipes] = [r1, r2]
      render
      
      response.should include_text "Robby's Stout"
      response.should include_text "Mike's Porter"
    end
  end
  describe "Other elements" do
    it "links to new recipe form" do
      assigns[:recipes] = []
      render
      response.should have_tag("a[href=?]", new_recipe_path)
    end
  end
end