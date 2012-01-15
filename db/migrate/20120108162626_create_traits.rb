class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :category
      t.text :description
      t.references :suspect
      t.boolean :found
      t.timestamps
    end
    add_index :traits, :suspect_id
  end
end
