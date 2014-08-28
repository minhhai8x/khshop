json.array!(@customers) do |customer|
  json.extract! customer, :id, :cus_name, :cus_address, :cus_phone, :cus_email, :cus_points, :cus_image, :cus_oauth, :cus_status
  json.url customer_url(customer, format: :json)
end
