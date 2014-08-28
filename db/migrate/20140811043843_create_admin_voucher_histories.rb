class CreateAdminVoucherHistories < ActiveRecord::Migration
  def change
    create_table :admin_voucher_histories do |t|
      t.integer :voucher_id
      t.integer :customer_id
      t.integer :user_id
      t.integer :v_amount
      t.integer :v_type

      t.timestamps
    end
  end
end
