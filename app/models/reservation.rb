class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reserved_equipments
  belongs_to :studio
  
  accepts_nested_attributes_for :reserved_equipments
  
  def judge_name
    if weekday_judge == true
      return "平日"
    else
      return "土日祝"
    end
  end
  
  def status_name
    case status
      when 0
        return "予約"
      when 1
        return "支払い済み"
      when 2
        return "キャンセル"
    end
  end
  
  def date_linking
    return start_at.strftime("%Y%m%d")
  end
  
  def fix_day_fee
    if (1..5) === start_at.wday 
      self.weekday_judge = true
      self.studio_fee_per_hour = self.studio.weekday_fee
    else
      self.weekday_judge = false
      self.studio_fee_per_hour = self.studio.weekend_fee
    end
  end
  
  def delimited_fee
    return "#{total_fee.to_s(:delimited)}円"
  end
  
  def delimited_hour_fee
    return "#{studio_fee_per_hour.to_s(:delimited)}円"
  end
end
