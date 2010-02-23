require 'spec_helper'

describe "/recipes/new.html.erb" do
  before do
    recipe = Factory.build :recipe
    assigns[:recipe] = recipe
  end
  it "renders the new recipe form" do
    render
    
    response.should have_tag("input[name=?]", "recipe[title]")
    response.should have_tag("input[name=?]", "recipe[style_title]")
    response.should have_tag("select[name=?]", "recipe[brew_type_id]")
    response.should have_tag("input[name=?]", "recipe[volume_in_gallons]")
    response.should have_tag("input[name=?]", "recipe[original_gravity]")
    response.should have_tag("input[name=?]", "recipe[final_gravity]")
    response.should have_tag("input[name=?]", "recipe[ibus]")
    response.should have_tag("input[name=?]", "recipe[srm]")
    response.should have_tag("input[name=?]", "recipe[abv]")
  end
end