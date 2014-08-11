class CreateArtistAvatars < ActiveRecord::Migration
  def change
    create_table :artist_avatars do |t|
      t.integer :artist_id
      t.string :origin
      t.string :small
      t.string :medium
      t.string :big

      t.timestamps
    end

    add_index :artist_avatars, :artist_id, unique: true
  end
end
