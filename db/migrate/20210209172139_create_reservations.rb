class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :studio_id
      t.datetime :start
      t.datetime :end
      t.boolean :weekday_judge
      t.integer :total_fee
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
