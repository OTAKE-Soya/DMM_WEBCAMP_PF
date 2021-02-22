class AddStudioFeePerHourToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :studio_fee_per_hour, :integer
  end
end
