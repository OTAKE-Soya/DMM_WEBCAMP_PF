class CreatePaidEquipments < ActiveRecord::Migration[5.2]
  def change
    create_table :paid_equipments do |t|
      t.string :name
      t.integer :equipment_genre_id
      t.integer :fee

      t.timestamps
    end
  end
end
