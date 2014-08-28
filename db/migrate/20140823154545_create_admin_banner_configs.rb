class CreateAdminBannerConfigs < ActiveRecord::Migration
  def change
    create_table :admin_banner_configs do |t|
      t.integer :bn_speed
      t.integer :bn_pause
      t.integer :bn_width
      t.integer :bn_random
      t.integer :bn_max_large
      t.integer :bn_max_small

      t.timestamps
    end
  end
end
