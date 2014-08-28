class CreateAdminCoupons < ActiveRecord::Migration
  def change
    create_table :admin_coupons do |t|
      t.string :name
      t.string :code
      t.string :discount
      t.datetime :start_date
      t.datetime :end_date
      t.integer :is_login
      t.integer :is_free_ship
      t.string :apply_products
      t.string :apply_catalogues
      t.integer :max_times
      t.integer :max_times_cus
      t.integer :status

      t.timestamps
    end
  end
end
