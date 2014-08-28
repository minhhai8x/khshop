class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :cs_name
      t.string :cs_address
      t.string :cs_phone
      t.string :cs_email
      t.text :cs_note
      t.integer :cs_status
      t.integer :cs_sum
      t.integer :pay_kind
      t.string :url, :limit=>5000
      t.integer :user_id
      t.timestamps
    end
  end
  def self.down
    drop_table :orders
  end
end
