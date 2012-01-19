class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.string :name
      t.text :description
      t.string :photo_path

      t.timestamps
    end
  end
end
