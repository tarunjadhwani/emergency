class CreateAmbulances < ActiveRecord::Migration
  def change
    create_table :ambulances do |t|
      t.string :vendor_name
      t.string :registration_number
      t.string :mobile
      t.string :driver_name
      t.string :type

      t.timestamps null: false
    end
  end
end
