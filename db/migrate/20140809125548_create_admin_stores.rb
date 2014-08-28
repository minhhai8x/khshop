class CreateAdminStores < ActiveRecord::Migration
  def self.up
    create_table :admin_stores do |t|
      t.string :s_name
      t.string :s_description, :limit=>5000
      t.string :s_address
      t.string :s_phone
      t.string :s_email
      t.string :s_logo
      t.string :s_acc_skype
      t.string :s_fb_title
      t.string :s_fb_name
      t.string :s_fb_link
      t.string :s_fb_appid
      t.integer :c_year
      t.string :c_link
      t.string :c_trade
      t.string :s_acc_tw
      t.string :s_sitemap

      t.timestamps
    end
  end
  def self.down
    drop_table :admin_stores
  end
end
