class AddColumnSystemConfigs < ActiveRecord::Migration
  def change
    add_column :admin_systemconfigs, :number_spec_home, :integer,:default=>0
    add_column :admin_systemconfigs, :spec_home_rand, :integer,:default=>0
    add_column :admin_systemconfigs, :number_new_home, :integer,:default=>0
    add_column :admin_systemconfigs, :new_home_rand, :integer,:default=>0
    
    add_column :admin_systemconfigs, :number_spec_cat, :integer,:default=>0
    add_column :admin_systemconfigs, :spec_cat_rand, :integer,:default=>0
    add_column :admin_systemconfigs, :number_new_cat, :integer,:default=>0
    add_column :admin_systemconfigs, :new_cat_rand, :integer,:default=>0
    
    add_column :admin_systemconfigs, :number_same_product, :integer,:default=>0
    add_column :admin_systemconfigs, :same_product_rand, :integer,:default=>0
    
    add_column :admin_systemconfigs, :banner_small, :integer,:default=>0
    add_column :admin_systemconfigs, :number_banner_small, :integer,:default=>0
    add_column :admin_systemconfigs, :banner_small_rand, :integer,:default=>0
    
    add_column :admin_systemconfigs, :banner_big, :integer,:default=>0
    add_column :admin_systemconfigs, :number_banner_big, :integer,:default=>0
    add_column :admin_systemconfigs, :banner_big_rand, :integer,:default=>0
    
    add_column :admin_systemconfigs, :is_popup, :integer,:default=>0
    add_column :admin_systemconfigs, :popup_position, :integer,:default=>0
  end
end
