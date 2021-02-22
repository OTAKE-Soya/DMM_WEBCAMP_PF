class ReservedEquipment < ApplicationRecord
  belongs_to :reservation
  belongs_to :paid_equipment
end
