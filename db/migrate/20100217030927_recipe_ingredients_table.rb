class RecipeIngredientsTable < ActiveRecord::Migration
  def self.up
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :unit_id
      t.float :quantity
      t.timestamps
    end
  end

  def self.down
    drop_table :recipe_ingredients
  end
end
