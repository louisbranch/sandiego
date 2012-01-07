class CreateSuspects < ActiveRecord::Migration
  def change
    create_table :suspects do |t|
      t.references :mission
      t.text :raw_info
      t.string :facebook_id
      t.string :name
      t.timestamps
    end
    add_index :suspects, :mission_id
    add_index :suspects, :facebook_id
  end
end

