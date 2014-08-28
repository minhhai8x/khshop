class CreateAdminProducts < ActiveRecord::Migration
  def self.up
    create_table :admin_products do |t|
      t.string :name
      t.integer :price
      t.integer :discount
      t.string :description, :limit=>5000
      t.integer :catid
      t.string :meta_keyword,:limit=>1024
      t.string :meta_description,:limit=>2048
      t.string :tags
      t.string :model
      t.integer :quantity,:default=>1
      t.string :weight 
      t.string :image, :limit=>512
      t.integer :manufacturer
      t.integer :special,:default=>0
      t.integer :reward_point,:default=>0
      t.integer :is_view,:default=>0
      t.integer :is_buy,:default=>0
      t.integer :status,:default=>0
      t.timestamps
    end
  end
  def self.down
    drop_table :admin_products
  end
end
