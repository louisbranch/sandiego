class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.text :description
      t.references :location
      t.timestamps
    end
    add_index :clues, :location_id
  end
end

