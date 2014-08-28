json.array!(@backup_restores) do |backup_restore|
  json.extract! backup_restore, :id, :br_reason, :br_userid, :br_note, :br_status
  json.url backup_restore_url(backup_restore, format: :json)
end
