class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.text :description
      t.references :city
      t.timestamps
    end
    add_index :clues, :city_id
  end
end
