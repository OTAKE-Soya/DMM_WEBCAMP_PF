class CreateStudios < ActiveRecord::Migration[5.2]
  def change
    create_table :studios do |t|
      t.string :name
      t.integer :weekday_fee
      t.integer :weekend_fee
      t.integer :area

      t.timestamps
    end
  end
end
