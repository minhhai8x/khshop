class NewProductController < ApplicationController
  def index
    #show catalogue
    @cats = Admin::Catalogue.where("parentid = 0")
    #new product
    
    @new_products = Admin::Product.order(created_at: :asc).limit(system_config.number_new_home)
  end
  
  def by_cat
    #show catalogue
    @cats = Admin::Catalogue.where("parentid = 0")
    @category = Admin::Catalogue.find(params[:id])
    #Special product
    @new_products = Admin::Product.where(catid: params[:id]).order(created_at: :asc).limit(system_config.number_new_cat)
  end
end
