class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :studio_id
      t.integer :equipment_genre_id

      t.timestamps
    end
  end
end
