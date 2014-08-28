class SpecialProductController < ApplicationController
  def index
    #show catalogue
    @cats = Admin::Catalogue.where("parentid = 0")
    #Special product
    @spec_products = Admin::Product.where("discount > 0").limit(system_config.number_spec_home)
  end
  
  def by_cat
    #show catalogue
    @cats = Admin::Catalogue.where("parentid = 0")
    @category = Admin::Catalogue.find(params[:id])
    #Special product
    @spec_products = Admin::Product.where(catid: params[:id]).where("discount > 0").limit(system_config.number_spec_cat)
  end
end
