class CreateOrderDetails < ActiveRecord::Migration
  def self.up
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.string :product_name
      t.integer :price
      t.integer :discount
      t.integer :qty, :default => 1
    end
  end
  def self.down
    drop_table :order_details
  end
end
