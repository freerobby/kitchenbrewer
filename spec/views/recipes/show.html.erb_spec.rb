require 'spec_helper'

describe "/recipes/show.html.erb" do
  setup :activate_authlogic
  before do
    style = Factory.create :style, :title => "Porter"
    user = Factory.create :user, :nickname => "Robby"
    brew_type = Factory.create :brew_type, :title => "Extract"
    recipe = Factory.create :recipe,
      :title => "My Recipe Title",
      :original_gravity => 1.030,
      :final_gravity => 1.011,
      :volume_in_gallons => 10,
      :style => style,
      :ibus => 25,
      :abv => 10.5,
      :srm => 22,
      :instructions => "1. Make the beer",
      :author => user,
      :brew_type => brew_type
    
    assigns[:recipe] = recipe
  end
  it "displays the recipe form" do
    render
    
    response.should include_text "My Recipe Title"
    response.should include_text "1.03"
    response.should include_text "1.011"
    response.should include_text "10"
    response.should include_text "Porter"
    response.should include_text "25"
    response.should include_text "10.5"
    response.should include_text "22"
    response.should include_text "1. Make the beer"
    response.should include_text "Robby"
    response.should include_text "Extract"
    response.should include_text "Ingredients"
    response.should include_text "Instructions"
  end
end