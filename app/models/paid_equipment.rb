class PaidEquipment < ApplicationRecord
  belongs_to :equipment_genre
  
  def name_with_fee
    return "#{name} （#{fee.to_s(:delimited)}円）"
  end
end
