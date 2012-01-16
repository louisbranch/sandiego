class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.references :mission
      t.references :track
      t.references :network
      t.integer :remaining_hours
      t.timestamps
    end
    add_index :progresses, :mission_id
    add_index :progresses, :track_id
    add_index :progresses, :network_id
  end
end
