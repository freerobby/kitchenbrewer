Factory.define :recipe_ingredient do |f|
  f.recipe {|recipe| recipe.association(:recipe)}
  f.ingredient {|ingredient| ingredient.association(:ingredient)}
  f.sequence(:quantity) {|t| t * 0.5}
  f.unit {|unit| unit.association(:unit)}
end