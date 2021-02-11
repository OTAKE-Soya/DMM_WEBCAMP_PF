class CreateCloses < ActiveRecord::Migration[5.2]
  def change
    create_table :closes do |t|
      t.date :close

      t.timestamps
    end
  end
end
