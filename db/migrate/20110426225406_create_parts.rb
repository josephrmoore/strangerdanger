class CreateParts < ActiveRecord::Migration
  def self.up
    create_table :parts do |t|
      t.string :name
    end
    
    create_table :parts_key, :id => false, :force => true do |t|
      t.references :song
      t.references :part
      t.references :user
    end
  end

  def self.down
    drop_table :parts
  end
end
