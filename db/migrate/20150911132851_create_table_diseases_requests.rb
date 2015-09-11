class CreateTableDiseasesRequests < ActiveRecord::Migration
  def change
    create_table :diseases_requests do |t|
      t.integer :disease_id
      t.integer :request_id
    end
  end
end
