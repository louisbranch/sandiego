class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :photo_path
      t.string :witness
      t.string :witness_photo_path
      t.timestamps
    end
  end
end
