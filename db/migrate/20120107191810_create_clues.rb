class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.string :category
      t.text :description
      t.references :suspect
      t.timestamps
    end
    add_index :clues, :suspect_id
  end
end

