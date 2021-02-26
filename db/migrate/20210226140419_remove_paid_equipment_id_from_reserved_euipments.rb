class RemovePaidEquipmentIdFromReservedEuipments < ActiveRecord::Migration[5.2]
  def change
    remove_column :reserved_equipments, :paid_equipment_id, :integer
  end
end
