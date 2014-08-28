class AddColumnAdminProduct < ActiveRecord::Migration
  def change
     add_column :admin_products, :arr_attr, :string,:limit=>1024
  end
end
