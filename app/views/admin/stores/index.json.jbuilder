json.array!(@admin_stores) do |admin_store|
  json.extract! admin_store, :id, :s_name, :s_description, :s_address, :s_phone, :s_email, :s_logo, :s_acc_skype, :s_fb_title, :s_fb_name, :s_fb_link, :s_fb_appid, :c_year, :c_link, :c_trade, :s_acc_tw, :s_sitemap
  json.url admin_store_url(admin_store, format: :json)
end
