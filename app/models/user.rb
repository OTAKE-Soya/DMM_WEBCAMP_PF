class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations
  
  def active_for_authentication?
    super && self.status #ここでstatusがfalseだとログインできない
  end
  
  def status_name
    if self.status
      return "有効"
    else
      return "無効"
    end
  end
end
