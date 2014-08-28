class CreateAdminBanners < ActiveRecord::Migration
  def change
    create_table :admin_banners do |t|
      t.string :lg_title, :limit=>512
      t.string :lg_description, :limit=>1024
      t.string :lg_imageurl, :limit=>1024
      t.integer :lg_type
      t.string :lg_btntitle, :limit=>512
      t.string :lg_link, :limit=>1024
      t.integer :lg_status

      t.timestamps
    end
  end
end
