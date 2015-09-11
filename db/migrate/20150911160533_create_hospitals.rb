class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name, null: false, default: ''
      t.string :phone, null: false, default: ''
      t.text :address
      t.string :contact_name
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :long, precision: 10, scale: 6
      t.decimal :rating, precision: 4, scale: 2
      t.timestamps null: false
    end
  end
end
