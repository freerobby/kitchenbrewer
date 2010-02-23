class AddBrewTypesTable < ActiveRecord::Migration
  def self.up
    create_table :brew_types do |t|
      t.string :title
      t.timestamps
    end
    add_column :recipes, :brew_type_id, :integer
  end

  def self.down
    remove_column :recipes, :brew_type_id
    drop_table :brew_types
  end
end
