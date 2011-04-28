class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :part_id
      t.integer :song_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
