class CreateAdminBackupRestores < ActiveRecord::Migration
  def change
    create_table :admin_backup_restores do |t|
      t.string :br_reason
      t.integer :br_userid
      t.string :br_note
      t.integer :br_status

      t.timestamps
    end
  end
end
