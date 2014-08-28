class SanphamController < ApplicationController
  
  #define actions
  def index
    @cats = Admin::Catalogue.where("parentid = 0")
    #get_banner_config.bn_width
    #banner bn_max_large bn_max_small
    if get_banner_config.bn_random == 1
      @banners_l = Admin::Banner.where("lg_type = 0").order("RANDOM()").limit(get_banner_config.bn_max_large)
      @banners_s = Admin::Banner.where("lg_type = 1").order("RANDOM()").limit(get_banner_config.bn_max_small)
    else
      @banners_l = Admin::Banner.where("lg_type = 0").order(bn_sortby: :asc).limit(get_banner_config.bn_max_large)
      @banners_s = Admin::Banner.where("lg_type = 1").order(bn_sortby: :asc).limit(get_banner_config.bn_max_small)
    end
    
    
    #new product
    if system_config.new_home_rand.to_i == 1
      @new_products = Admin::Product.order(created_at: :asc).order("RANDOM()").limit(system_config.number_new_home)
    else
      @new_products = Admin::Product.order(created_at: :asc).limit(system_config.number_new_home)
    end
    #special product
    if system_config.spec_home_rand.to_i == 1
      @spec_products = Admin::Product.where("discount > 0").order("RANDOM()").limit(system_config.number_spec_home)
    else
      @spec_products = Admin::Product.where("discount > 0").limit(system_config.number_spec_home)
    end
    
  end
  # GET /sanpham/1
  def products_by_cat
    @cats = Admin::Catalogue.where("parentid = 0")
    
    @category = Admin::Catalogue.find(params[:id])
    
    #New product
    @products_new = Admin::Product.where(catid: @category.id).order(created_at: :asc).take(3)
    
    #Special product
    @products_spec = Admin::Product.where(catid: @category.id).where("discount > 0").take(3)
    
    #paginate
    @products = Admin::Product.where(catid: @category.id).page(params[:page]).per(system_config.number_category.to_i)
  end
  # GET /sanpham/:id/add_to_cart
  def add_to_cart
    #@sp  =  Admin::Product.find(params[:id])
    session[:gh]  << params[:id]
    
    respond_to  do  |format|
      format.json    {  render  :json  =>  session[:gh]  }  
    end
  end
  # GET /sanpham/:id/:qty/btn_add_to_cart
  def btn_add_to_cart
    @id_qty = params[:id_qty]
    @id_qty = @id_qty.split('-')
    @id = @id_qty[0]
    @qty = @id_qty[1]
    
    @qty.to_i.times do |t|
      session[:gh]  << @id  
    end
  end
  
  def detail
    # set is_view
    @product = Admin::Product.find(params[:id])
    @product.is_view += 1
    @product.save
    #show catalogue
    @cats = Admin::Catalogue.where("parentid = 0")
    
    @category = Admin::Catalogue.find(@product.catid)
    #same category
    @same_products = Admin::Product.where("id != ? AND catid = ?",@product.id,@category.id).limit(system_config.number_same_product)
    
    #get attribute
    @attrs = Admin::Attribute.where(:product_id=>@product.id)
  end
  private
    
   
end
