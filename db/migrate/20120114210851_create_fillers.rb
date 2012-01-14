class CreateFillers < ActiveRecord::Migration
  def change
    create_table :fillers do |t|
      t.text :description
      t.boolean :correct

      t.timestamps
    end
  end
end
