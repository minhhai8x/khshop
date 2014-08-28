json.array!(@manufacturers) do |manufacturer|
  json.extract! manufacturer, :id, :name, :address, :phone, :status
  json.url manufacturer_url(manufacturer, format: :json)
end
