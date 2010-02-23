require 'spec_helper'

describe "/recipes/edit.html.erb" do
  before do
    unit = Factory.create :unit, :title => "teaspoons"
    sugar = Factory.create :ingredient, :title => "Sugar"
    malt = Factory.create :ingredient, :title => "Malt"
    recipe = Factory.create :recipe, :title => "My Recipe"
    Factory.create :recipe_ingredient, :unit => unit, :quantity => 3, :recipe => recipe, :ingredient => sugar
    Factory.create :recipe_ingredient, :unit => unit, :quantity => 2, :recipe => recipe, :ingredient => malt
    3.times {recipe.recipe_ingredients.build}
    assigns[:recipe] = recipe
  end
  it "renders the edit recipe form" do
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
    
    response.should have_tag("input[name=?]", "recipe[recipe_ingredients_attributes][0][ingredient_title]")
    response.should have_tag("input[name=?]", "recipe[recipe_ingredients_attributes][0][quantity]")
    response.should have_tag("select[name=?]", "recipe[recipe_ingredients_attributes][0][unit_id]")
    response.should have_tag("input[name=?]", "recipe[recipe_ingredients_attributes][1][ingredient_title]")
    response.should have_tag("input[name=?]", "recipe[recipe_ingredients_attributes][1][quantity]")
    response.should have_tag("select[name=?]", "recipe[recipe_ingredients_attributes][1][unit_id]")
    
    response.should have_tag("textarea[name=?]", "recipe[instructions]")
  end
  it "renders supplied blank slots for new ingredients" do
    render
    2.upto(4) do |num|
      response.should have_tag("input[name=?]", "recipe[recipe_ingredients_attributes][#{num}][ingredient_title]")
      response.should have_tag("input[name=?]", "recipe[recipe_ingredients_attributes][#{num}][quantity]")
      response.should have_tag("select[name=?]", "recipe[recipe_ingredients_attributes][#{num}][unit_id]")
    end
  end
end