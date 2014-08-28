class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #before_filter lambda { cancan_hack(params[:admin_user]) }
  
  #config for cart
   
  #Intialize_session
  before_filter :intialize_session
  #set number of products in cart
  helper_method :cart_qty,:get_voucher_info,:check_discount,:get_submenu,:get_banner_config,:get_product_info,:get_attribute,:get_attribute_product, :system_config, :store_info, :day_of_month, :begin_of_date, :end_of_date, :email_config
  
  # after login redirect
  def after_sign_in_path_for(resource)
    if current_user.role ==  "superadmin"
      "/admin/myreports"
    else
      if current_user.role ==  "manager"
         "/admin/myreports"
      else
         if current_user.role ==  "content"
           "/admin/products"
         else
           if current_user.role ==  "sale"
             "/admin/orders"
           end
         end  
      end
    end   
  end
  
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    "/admin"
  end
 
  #cancan exception
  rescue_from CanCan::AccessDenied do |exception|
    #redirect_to "/admin/homes/", :alert => exception.message
    render :file => "#{Rails.root}/public/403.html.erb", :status => 403, :layout => false
  end
  
  private
  
  #cart
  def  current_cart
    Cart.find(session[:cart_id])
  rescue  ActiveRecord::RecordNotFound
    cart  =  Cart.create
    session[:cart_id]  =  cart.id
    cart
  end
  
  
  #session cart
  
      #session[:gh] = Hash.new      
  
  def intialize_session
      #session[:gh] ||= Hash.new
      session[:gh] ||= Array.new
  end
 
  #set number of products in cart
  def cart_qty
    session[:gh].uniq.count
  end
  #get submenu
  def get_submenu(menu_id)
    @sub_cat = []
    @sub =  Admin::Catalogue.where(:parentid => menu_id)
    @sub.each do |s|
      @sub_cat << s
    end
    @sub_cat
  end
  #get product information
  def get_product_info(id)
    Admin::Product.find(id)
  end
  #get atrribute
  def get_attribute(id)
    @attr = Admin::Attribute.find(id)
    @attr
  end
  #get atrribute by product
  def get_attribute_product(id,pid)
    @product = Admin::Product.find(pid)
    if @product.arr_attr
      @arr_pid = @product.arr_attr.split(",").map { |s| s.to_i }
      @result = 0
      @arr_pid.each do |p|
        if p > 0
          if p == id
            @result = id
          end
        end
      end
      @attr = Admin::Attribute.find(id)
      @attr.description
    else
      ""      
    end
  end
  #System Config
  def system_config
    Admin::Systemconfig.first
  end
  #Store Information
  def store_info
    Admin::Store.first
  end
  #Number day of month
  def day_of_month
    @MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    @month = Time.now.month
    
    if @month == 2 && Date.gregorian_leap?(Time.now.year)
      @days = 29 
    else
      @days = @MONTH[@month]
    end
    @days
  end
  #get begin of date
  def begin_of_date(bdate)
    (Time.now.year.to_s+'-'+Time.now.month.to_s+'-'+bdate.to_s).to_date.beginning_of_day.localtime
  end
  #get end of date
  def end_of_date(edate)
    (Time.now.year.to_s+'-'+Time.now.month.to_s+'-'+edate.to_s).to_date.end_of_day.localtime
  end
  #action mailer config
  def email_config
    Admin::Mymailer.first
  end
  #check discount
  def check_discount(product_id)
    @flg = false
    unless session[:cp_arr_product].nil?
      if session[:cp_arr_product].split(',').include? product_id
        @flg = true
      else
        @flg = false  
      end
    else
      @flg = false
    end
    #check discount for catalogue
    unless session[:cp_arr_catalogue].nil?
        @catid = Admin::Product.find(product_id).catid
        if session[:cp_arr_catalogue].split(',').include? @catid
          @flg = true
        else
          @flg = false  
        end
    end
  end
  #get_voucher_info
  def get_voucher_info(voucher_id)
    Admin::Voucher.find(voucher_id)
  end
  #get_banner_config
  def get_banner_config
    Admin::BannerConfig.first
  end
end
