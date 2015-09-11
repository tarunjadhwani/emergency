class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name, null: false, default: ''
      t.string :mobile, null: false, default: ''
      t.text :address
      t.integer :recommendations
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :long, precision: 10, scale: 6
      t.string :type
      t.timestamps null: false
    end
  end
end
