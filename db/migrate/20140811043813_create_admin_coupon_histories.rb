class CreateAdminCouponHistories < ActiveRecord::Migration
  def change
    create_table :admin_coupon_histories do |t|
      t.integer :coupon_id
      t.integer :customer_id
      t.integer :user_id
      t.integer :c_amount
      t.integer :c_type

      t.timestamps
    end
  end
end
