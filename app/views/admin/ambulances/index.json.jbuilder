json.array!(@ambulances) do |ambulance|
  json.extract! ambulance, :id
  json.url ambulance_url(ambulance, format: :json)
end
