class Studio < ApplicationRecord
  has_many :reserved_studios
  has_many :reservations
  has_many :equipments
end
