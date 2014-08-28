json.array!(@admin_coupons) do |admin_coupon|
  json.extract! admin_coupon, :id, :name, :code, :discount, :start_date, :end_date, :is_login, :is_free_ship, :apply_products, :apply_catalogues, :max_times, :max_times_cus, :status
  json.url admin_coupon_url(admin_coupon, format: :json)
end
