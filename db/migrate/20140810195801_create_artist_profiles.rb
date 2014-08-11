class CreateArtistProfiles < ActiveRecord::Migration
  def change
    create_table :artist_profiles do |t|
      t.integer :artist_id
      t.string :nickname, null: false
      t.integer :sex, default: 0 # default 0 is female
      t.string :email
      t.date :birthday, null: false
      t.string :begin_year, null: false
      t.text :description
      t.string :address, null: false
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end

    add_index :artist_profiles, :artist_id, unique: true
    add_index :artist_profiles, :nickname, unique: true
    add_index :artist_profiles, :email, unique: true
  end
end
