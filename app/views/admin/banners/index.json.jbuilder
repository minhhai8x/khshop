json.array!(@admin_banners) do |admin_banner|
  json.extract! admin_banner, :id, :lg_title, :lg_description, :lg_url, :lg_type, :lg_btntitle, :lg_link, :lg_status
  json.url admin_banner_url(admin_banner, format: :json)
end
