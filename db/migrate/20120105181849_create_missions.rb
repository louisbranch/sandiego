class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.references :user
      t.references :headline
      t.references :rank
      t.integer :hours
      t.integer :xp
      t.boolean :finished
      t.boolean :won
      t.timestamps
    end
    add_index :missions, :user_id
    add_index :missions, :headline_id
    add_index :missions, :rank_id
  end
end
