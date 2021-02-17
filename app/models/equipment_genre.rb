class EquipmentGenre < ApplicationRecord
  has_many :equipments
  has_many :paid_equipments
end
