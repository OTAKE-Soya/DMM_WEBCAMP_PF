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
    return start.strftime("%Y%m%d")
  end
end
