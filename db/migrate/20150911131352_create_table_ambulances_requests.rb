class CreateTableAmbulancesRequests < ActiveRecord::Migration
  def change
    create_table :ambulances_requests, :id => false do |t|
      t.integer :ambulance_id
      t.integer :request_id
    end
  end
end
