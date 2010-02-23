class AddStylesTable < ActiveRecord::Migration
  def self.up
    create_table :styles do |t|
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :styles
  end
end
