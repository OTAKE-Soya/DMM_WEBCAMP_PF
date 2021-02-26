class AddNameToReservedEquipments < ActiveRecord::Migration[5.2]
  def change
    add_column :reserved_equipments, :name, :string
  end
end
