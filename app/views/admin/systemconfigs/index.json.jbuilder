json.array!(@admin_systemconfigs) do |admin_systemconfig|
  json.extract! admin_systemconfig, :id, :country, :backend_lang, :frontend_lang, :currency, :number_bestbuy, :number_bestsell, :number_category, :is_viewer, :is_description, :google_access_id, :google_secret_key, :google_bucket, :google_analytic_id
  json.url admin_systemconfig_url(admin_systemconfig, format: :json)
end
