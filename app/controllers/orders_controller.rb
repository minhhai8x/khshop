class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  helper_method :get_product_info,:paypal_url
  # GET /orders
  # GET /orders.json
  def index
    @customer = Customer.new
    @orders = Order.all
    @cats = Admin::Catalogue.where("parentid = 0")
    @product_ids = session[:gh]
   
    @product_sum = 0
    @product_ids.uniq.each do |v|
      if v.present?
        #check discount for product
        if check_discount(v)
          if session[:cp_type].to_i == 0
            @product_sum += (@product_ids.count(v)*get_product_info(v).price)*(1-(session[:cp_discount].to_f/100))
          else
            @product_sum += (@product_ids.count(v)*get_product_info(v).price) - session[:cp_discount].to_i  
          end
          
        else
          @product_sum += @product_ids.count(v)*get_product_info(v).price
        end
      end
    end
    @cpflg = 0
    
    #check discount for order
    unless session[:cp_discount].nil?
      if session[:cp_discount].to_i > 0
        if session[:cp_arr_product].nil?
          @cpflg = 1
          if session[:cp_type].to_i == 0
            @product_sum = @product_sum*(1-(session[:cp_discount].to_f/100))
          else
            @product_sum = @product_sum -session[:cp_discount].to_i      
          end
        end
      end  
    end
    
    #form orders
    @order = Order.new
    @cart = Order.new
  end
  #check_coupon
  def check_coupon
    @flg = 0
    if Admin::Coupon.exists?(:code=>params[:id])
      @coupon = Admin::Coupon.where(:code=>params[:id]).first
      
      if @coupon.end_date > Time.now && @coupon.status == 1
        session[:cp_arr_product] = @coupon.apply_products
        session[:cp_arr_catalogue] = @coupon.apply_catalogues
        session[:cp_type] = @coupon.discount_type
        session[:cp_discount] = @coupon.discount
        @flg = 1  
        unless session[:customer].nil?
          #insert coupon history
          @customer_id = Customer.where(:cus_email=>session[:customer]).first.id
          @history_coupon = Admin::CouponHistory.new({:coupon_id=>@coupon.id,:customer_id=>@customer_id,:c_amount=>@coupon.discount,:c_type=>@coupon.discount_type})
          @history_coupon.save  
        end
      end
    end
  end
  #update cart
  def update_to_cart
    @product_id = params[:id]
    @product_qty = params[:qty]
    
    @id_count = session[:gh].count(@product_id)
    session[:gh].delete(@product_id)
    @product_qty.to_i.times do |t|
      session[:gh] << @product_id
    end  
   
  end
  #del_product_cart
  def del_product_cart
    @product_id = params[:id]
    session[:gh].delete(@product_id)
  end
  # GET /orders/1
  # GET /orders/1.json
  def show
    
    @cats = Admin::Catalogue.where("parentid = 0")
    #session[:gh] = Array.new
    @order_id = session[:gh_id]
    @order = Order.where(:id=>@order_id).first
    
  end
  
  # GET /orders/new
  def new
    @order = Order.new
    
  end

  # GET /orders/1/edit
  def edit
    
  end

  # POST /orders
  # POST /orders.json
  def create
    unless session[:customer].nil?
      @cus = Customer.where(:cus_email=>session[:customer]).first
      @point = @cus.cus_points.to_i + 1
      @cus.update(:cus_points=>@point)
      params[:order][:user_id] = @cus.id
    end
    
    @order = Order.new(order_params)
    
    respond_to do |format|
      if @order.save
        @order_last = Order.last
        session[:gh_id] = @order_last.id
        session[:gh].uniq.each do |od|
          if od.present?
           @product = Admin::Product.where(:id=>od).first
           @product.is_buy += 1
           @product.save
            params[:order_detail] = {:order_id=>@order_last.id, :product_id=>od, :product_name=>@product.name, :price=>@product.price, :discount=>@product.discount,:qty=>session[:gh].count(od)}
            @order_detail = OrderDetail.new(order_detail_params)
            @order_detail.save
          end
        end
        session[:gh] = Array.new
        session[:cp_discount] = nil
        #PAYPAL
        if params[:order][:pay_kind].to_i == 1
          
          format.html { redirect_to params[:order][:url], notice: 'Order was successfully created.' }
        else
          format.html { redirect_to @order, notice: 'Order was successfully created.' }    
        end
    
        
      end
    end
    
  end
 
  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      #params[:order]
      params.require(:order).permit(:cs_name, :cs_address, :cs_phone, :cs_email, :cs_note,:cs_sum, :pay_kind, :url, :user_id)
    end
    def order_detail_params
      params.require(:order_detail).permit(:order_id, :product_id, :product_name, :price, :discount,:qty)
    end
    #get product information
    def get_product_info(product_id)
      @product = Admin::Product.where(:id => product_id).first
      @product
    end
    
    #PAYPAL
  def paypal_url(return_url)
    values = {
      :business => system_config.paypal_account,
      :cmd => '_cart',
      :upload => 1,
      :return => return_url
     
    }
    #session[:gh]
     @product_ids = session[:gh]
    @product_ids.uniq.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => (get_product_info(item).price/system_config.rate.to_i),
        "item_name_#{index+1}" => get_product_info(item).name,
        "item_number_#{index+1}" => get_product_info(item).id,
        "quantity_#{index+1}" => @product_ids.count(item)
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
