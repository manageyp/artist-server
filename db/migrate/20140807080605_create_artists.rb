class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :nickname, null: false
      t.integer :sex, default: 0 # default 0 is female
      t.string :telephone, null: false
      t.string :email
      t.date :birthday, null: false
      t.string :begin_year, null: false
      t.string :avatar
      t.text :description
      t.string :address, null: false
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.integer :status, default: 0 # default 0 is pending

      t.timestamps
    end

    add_index :artists, :nickname, unique: true
    add_index :artists, :telephone, unique: true
    add_index :artists, :email, unique: true
  end
end
