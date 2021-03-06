class Contact < ApplicationRecord
  def status_name
    if self.processed_status
      return "対応済み"
    else
      return "未対応"
    end
  end
  
  def process_update
    if processed_status
      self.processed_status = false
    else
      self.processed_status = true
    end
  end
end
