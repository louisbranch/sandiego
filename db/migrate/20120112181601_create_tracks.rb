class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :mission
      t.references :city
      t.integer :level
      t.boolean :correct
      t.boolean :final

      t.timestamps
    end
    add_index :tracks, :mission_id
    add_index :tracks, :city_id
  end
end
