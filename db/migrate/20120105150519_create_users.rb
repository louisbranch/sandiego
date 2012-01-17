class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :facebook_id
      t.string :oauth_token
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :rank
      t.integer :xp
      t.timestamps
    end
    add_index :users, :facebook_id
    add_index :users, :rank_id
  end
end
