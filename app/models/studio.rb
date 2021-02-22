class Studio < ApplicationRecord
  has_many :reservations
  has_many :equipments
end
