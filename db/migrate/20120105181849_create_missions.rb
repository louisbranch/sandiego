class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.date :end_date
      t.references :user
      t.references :rank
      t.references :status
      t.timestamps
    end
    add_index :missions, :user_id
    add_index :missions, :rank_id
    add_index :missions, :status_id
  end
end

