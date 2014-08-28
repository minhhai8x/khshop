class AddColumnCoupon < ActiveRecord::Migration
  def change
    add_column :admin_coupons, :discount_type, :integer, :default=>0
  end
end
