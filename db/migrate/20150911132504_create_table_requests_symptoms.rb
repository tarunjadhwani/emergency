class CreateTableRequestsSymptoms < ActiveRecord::Migration
  def change
    create_table :requests_symptoms, id: false do |t|
      t.integer :symptom_id
      t.integer :request_id
    end
  end
end
