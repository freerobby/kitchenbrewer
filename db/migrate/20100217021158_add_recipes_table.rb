class AddRecipesTable < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.integer :tweak_of_id
      t.string :title
      t.decimal :original_gravity, :precision => 4, :scale => 3
      t.decimal :final_gravity, :precision => 4, :scale => 3
      t.integer :volume_in_gallons
      t.integer :style_id
      t.integer :ibus
      t.decimal :abv, :precision => 4, :scale => 3
      t.integer :srm
      t.text :instructions
      t.integer :author_id
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
