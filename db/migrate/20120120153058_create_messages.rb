class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user
      t.references :mission
      t.text :description

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :mission_id
  end
end
