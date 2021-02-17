class CreateReservedStudios < ActiveRecord::Migration[5.2]
  def change
    create_table :reserved_studios do |t|
      t.integer :reservation_id
      t.integer :studio_id
      t.integer :fee

      t.timestamps
    end
  end
end
