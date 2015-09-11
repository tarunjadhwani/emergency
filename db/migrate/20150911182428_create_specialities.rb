class CreateSpecialities < ActiveRecord::Migration
  def change
    create_table :specialities do |t|
      t.string :name, null: false, default: ''
      t.text :description
      t.timestamps null: false
    end
  end
end
