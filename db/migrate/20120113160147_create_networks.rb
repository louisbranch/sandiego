class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.references :track
      t.references :location
      t.references :informable, :polymorphic => true
      t.boolean :final
      t.timestamps
    end
    add_index :networks, :track_id
    add_index :networks, :location_id
  end
end
