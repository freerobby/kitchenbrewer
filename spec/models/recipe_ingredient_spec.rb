require 'spec_helper'

describe RecipeIngredient do
  describe "validation" do
    describe "recipe" do
      it "is present" do
        lambda {
          Factory.create :recipe_ingredient, :recipe => nil
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
    describe "ingredient" do
      it "is present" do
        lambda {
          Factory.create :recipe_ingredient, :ingredient => nil
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
    describe "unit" do
      it "is present" do
        lambda {
          Factory.create :recipe_ingredient, :unit => nil
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
    describe "quantity" do
      it "is greater than 0" do
        lambda {
          Factory.create :recipe_ingredient, :quantity => -1
        }.should raise_error ActiveRecord::RecordInvalid
        lambda {
          Factory.create :recipe_ingredient, :quantity => 0
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
