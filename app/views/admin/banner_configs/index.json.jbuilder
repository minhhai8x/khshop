json.array!(@admin_banner_configs) do |admin_banner_config|
  json.extract! admin_banner_config, :id, :bn_speed, :bn_pause, :bn_width, :bn_random, :bn_max_large, :bn_max_small
  json.url admin_banner_config_url(admin_banner_config, format: :json)
end
