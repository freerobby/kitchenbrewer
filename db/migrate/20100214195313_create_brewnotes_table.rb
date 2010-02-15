class CreateBrewnotesTable < ActiveRecord::Migration
  def self.up
    create_table :brewnotes do |t|
      t.integer :brew_id
      t.text :body
      t.datetime :recorded_at
      t.decimal :gravity, :precision => 4, :scale => 3
      t.timestamps
    end
  end

  def self.down
    drop_table :brew_notes
  end
end
