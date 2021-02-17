class CreateReservedEquipments < ActiveRecord::Migration[5.2]
  def change
    create_table :reserved_equipments do |t|
      t.integer :reservation_id
      t.integer :paid_equipment_id
      t.integer :fee

      t.timestamps
    end
  end
end
