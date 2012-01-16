class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :position
      t.string :name
      t.integer :xp
      t.integer :track_breadth
      t.integer :track_depth
      t.timestamps
    end
  end
end
