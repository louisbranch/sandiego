class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.references :user
      t.integer :prize
      t.date :end_date
      t.references :rank
      t.timestamps
    end
    add_index :missions, :user_id
    add_index :missions, :rank_id
  end
end

