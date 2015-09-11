class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :mobile
      t.text :address
      t.string :lat
      t.string :long
      t.integer :ambulance_id
      t.integer :hospital_id
      t.integer :doctor_id

      t.timestamps null: false
    end
    add_index :requests, :ambulance_id
    add_index :requests, :hospital_id
    add_index :requests, :doctor_id
  end
end
