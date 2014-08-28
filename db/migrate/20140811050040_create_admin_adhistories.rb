class CreateAdminAdhistories < ActiveRecord::Migration
  def change
    create_table :admin_adhistories do |t|
      t.string :his_message
      t.integer :his_status

      t.timestamps
    end
  end
end
