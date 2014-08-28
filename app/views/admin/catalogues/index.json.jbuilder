json.array!(@admin_catalogues) do |admin_catalogue|
  json.extract! admin_catalogue, :id, :name
  json.url admin_catalogue_url(admin_catalogue, format: :json)
end
