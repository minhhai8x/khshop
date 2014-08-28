class CreateAdminAttributes < ActiveRecord::Migration
  def self.up
    create_table :admin_attributes do |t|
      t.string :name
      t.string :description, :limit=>1024
      t.integer :orderby, :default=>0
      t.integer :product_id, :default=>0

      t.timestamps
    end
  end
  def self.down
    drop_table :admin_attributes
  end
end
