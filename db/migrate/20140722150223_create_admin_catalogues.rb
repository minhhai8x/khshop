class CreateAdminCatalogues < ActiveRecord::Migration
  def self.up
    create_table :admin_catalogues do |t|
      t.string :name
      t.integer :parentid, :default=>0
      t.string :description,:limit=>1024
      t.string :meta_keyword,:limit=>512
      t.string :meta_description,:limit=>512
      t.integer :sort_order,:default=>0
      t.integer :status,:default=>0
      t.timestamps
    end
  end
  def self.down
    drop_table :admin_catalogues
  end
end
