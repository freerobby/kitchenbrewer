class CreateIngredientsTable < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|
      t.string :title
      t.integer :default_unit_id
      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end
