class CreateBrewsTable < ActiveRecord::Migration
  def self.up
    create_table :brews do |t|
      t.integer :user_id
      t.string :recipe_title
      t.decimal :intended_original_gravity, :precision => 4, :scale => 3
      t.decimal :intended_final_gravity, :precision => 4, :scale => 3
      t.decimal :actual_original_gravity, :precision => 4, :scale => 3
      t.decimal :actual_final_gravity, :precision => 4, :scale => 3
      t.timestamp :began_at
      t.timestamp :completed_at
      t.timestamps
    end
  end

  def self.down
    drop_table :brews
  end
end
