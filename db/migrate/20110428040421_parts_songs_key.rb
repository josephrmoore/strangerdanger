class PartsSongsKey < ActiveRecord::Migration
  def self.up
      create_table :parts_songs, :id => false do |t|
        t.integer :song_id
        t.integer :part_id
      end
    end

    def self.down
      drop_table :parts_songs
    end
  end