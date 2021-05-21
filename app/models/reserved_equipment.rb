class ReservedEquipment < ApplicationRecord
  belongs_to :reservation
  
  def delimited_fee
    return "#{fee.to_s(:delimited)}円"
  end
end
