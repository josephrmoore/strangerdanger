class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :name
      t.string :file
      t.boolean :active, :default => false
      t.boolean :recorded, :default => false
      t.boolean :current, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
