class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :cus_name
      t.string :cus_address, :limit=>1024
      t.string :cus_phone
      t.string :cus_email
      t.string :cus_password
      t.integer :cus_points
      t.string :cus_image, :limit=>2048
      t.string :cus_oauth, :limit=>1024
      t.integer :cus_status, :default=>0

      t.timestamps
    end
  end
end
