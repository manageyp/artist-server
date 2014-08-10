class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :password, null: false
      t.string :mobile, null: false
      t.integer :status, default: 0 # default 0 is pending

      t.timestamps
    end

    add_index :artists, :mobile, unique: true
  end
end
