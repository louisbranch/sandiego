class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :name
      t.integer :track_breadth
      t.integer :track_depth
      t.timestamps
    end
  end
end
