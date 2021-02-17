class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reserved_equipments
  has_many :reserved_studios
  
  def judge
    
  end
end
