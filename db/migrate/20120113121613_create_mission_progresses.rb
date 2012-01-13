class CreateMissionProgresses < ActiveRecord::Migration
  def change
    create_table :mission_progresses do |t|
      t.references :mission
      t.references :track

      t.timestamps
    end
    add_index :mission_progresses, :mission_id
    add_index :mission_progresses, :track_id
  end
end
