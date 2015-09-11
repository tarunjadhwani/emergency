class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name, null: false, default: ''
      t.text :description
      t.timestamps null: false
    end
  end
end
