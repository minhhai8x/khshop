class CreateAdminVouchers < ActiveRecord::Migration
  def change
    create_table :admin_vouchers do |t|
      t.string :v_code
      t.string :from_name
      t.string :from_email
      t.string :to_name
      t.string :to_email
      t.string :v_messsage
      t.string :v_amount
      t.integer :v_status

      t.timestamps
    end
  end
end
