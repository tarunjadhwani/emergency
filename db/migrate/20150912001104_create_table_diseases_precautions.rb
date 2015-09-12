class CreateTableDiseasesPrecautions < ActiveRecord::Migration
  def change
    create_table :diseases_precautions, id: false do |t|
      t.integer :disease_id
      t.integer :precaution_id
    end
  end
end
