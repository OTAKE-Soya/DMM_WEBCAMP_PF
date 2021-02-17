class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :title
      t.text :body
      t.boolean :processed_status, default: false

      t.timestamps
    end
  end
end
