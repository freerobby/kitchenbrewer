class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unit
  
  validates_presence_of :recipe
  validates_presence_of :ingredient
  validates_presence_of :unit
  validates_numericality_of :quantity, :greater_than => 0
  
  def ingredient_title
    ingredient.title if ingredient
  end
  def ingredient_title=(title)
    self.ingredient = Ingredient.find_or_create_by_title(title) unless title.blank?
  end
end
