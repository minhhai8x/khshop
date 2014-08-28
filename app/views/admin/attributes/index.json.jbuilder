json.array!(@admin_attributes) do |admin_attribute|
  json.extract! admin_attribute, :id, :name, :description, :orderby, :product_id
  json.url admin_attribute_url(admin_attribute, format: :json)
end
