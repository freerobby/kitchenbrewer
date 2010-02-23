class AddCategoriesTable < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :title
      t.timestamps
    end
    add_column :ingredients, :category_id, :integer
  end

  def self.down
    remove_column :ingredients, :category_id
    drop_table :categories
  end
end
