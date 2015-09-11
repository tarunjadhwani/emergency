json.array!(@precautions) do |precaution|
  json.extract! precaution, :id, :description, :video_url
  json.url precaution_url(precaution, format: :json)
end
