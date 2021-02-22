class PaidEquipment < ApplicationRecord
  belongs_to :equipment_genre
  has_many :reserved_equipments
end
