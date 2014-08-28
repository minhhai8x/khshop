json.array!(@admin_vouchers) do |admin_voucher|
  json.extract! admin_voucher, :id, :v_code, :from_name, :from_email, :to_name, :to_email, :v_messsage, :v_amount, :v_status
  json.url admin_voucher_url(admin_voucher, format: :json)
end
