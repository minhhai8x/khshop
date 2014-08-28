class CreateAdminSystemconfigs < ActiveRecord::Migration
  def change
    create_table :admin_systemconfigs do |t|
      t.string :currency
      t.integer :rate
      t.integer :number_bestbuy
      t.integer :number_bestsell
      t.integer :number_category
      t.integer :is_viewer
      t.integer :is_description
      t.string :google_access_id
      t.string :google_secret_key
      t.string :google_bucket
      t.string :google_analytic_id
      t.string :paypal_account
    end
  end
end
