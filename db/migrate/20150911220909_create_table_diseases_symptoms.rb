class CreateTableDiseasesSymptoms < ActiveRecord::Migration
  def change
    create_table :diseases_symptoms, id: false do |t|
      t.integer :disease_id
      t.integer :symptom_id
    end
  end
end
