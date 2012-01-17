class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :position
      t.string :name
      t.integer :track_breadth
      t.integer :track_depth
      t.integer :minimum_xp
      t.integer :bonus_multiplier
      t.timestamps
    end
  end
end
