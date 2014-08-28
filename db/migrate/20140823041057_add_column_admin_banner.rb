class AddColumnAdminBanner < ActiveRecord::Migration
  def change
    add_column :admin_banners, :bn_sortby, :integer, :default=>0
  end
end
