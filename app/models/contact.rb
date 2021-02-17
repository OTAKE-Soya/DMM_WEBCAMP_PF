class Contact < ApplicationRecord
  def status_name
    if self.processed_status
      return "対応済み"
    else
      return "未対応"
    end
  end
end
