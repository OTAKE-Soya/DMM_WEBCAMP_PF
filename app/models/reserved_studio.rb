class ReservedStudio < ApplicationRecord
  belongs_to :studio
  belongs_to :reservation
end
