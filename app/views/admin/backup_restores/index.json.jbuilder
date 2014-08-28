json.array!(@admin_backup_restores) do |admin_backup_restore|
  json.extract! admin_backup_restore, :id, :br_reason, :br_userid, :br_note, :br_status
  json.url admin_backup_restore_url(admin_backup_restore, format: :json)
end
