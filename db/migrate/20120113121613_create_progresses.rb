class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.references :mission
      t.references :track
      t.integer :remaining_hours
      t.timestamps
    end
    add_index :progresses, :mission_id
    add_index :progresses, :track_id
  end
end
