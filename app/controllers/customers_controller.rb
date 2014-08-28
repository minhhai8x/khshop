class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :check_customer_login, except: [:login,:check_login,:new]
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end
  
  #login
  def login
    @cats = Admin::Catalogue.where("parentid = 0")
  end
  #my order
  def my_order
    
    @cats = Admin::Catalogue.where("parentid = 0")
    @cus = Customer.where(:cus_email=>session[:customer]).first
    @myorders = Order.where(:user_id=>@cus.id)
    @sum = Order.where(:user_id=>@cus.id).sum(:cs_sum)
    
  end
  #my information
  def my_info
    
    @cats = Admin::Catalogue.where("parentid = 0")
    @cus = Customer.where(:cus_email=>session[:customer]).first
  end
  #logout
  def logout
    session[:customer] = nil
    redirect_to root_path
  end
  #check login
  def check_login
    @data = params[:hdata]
    @flag = 0
    if @data
      if Customer.exists?(:cus_email=>@data[:email],:cus_password => @data[:passwd])
        @flag = 1
        session[:customer]  =  @data[:email]
      end
    end
    
  end
  # GET /customers/new
  def new
      @params= {:cus_email=>params[:cus_email], :cus_password=>(0...8).map { (65 + rand(26)).chr }.join}
      @customer = Customer.new(@params)
      if @customer.save
        UserMailer.mail_setting(store_info,email_config)
        UserMailer.welcome_email(@customer,store_info).deliver
      end
  end
  
  # GET /customers/1/edit
  def edit
  end
  
  # POST /customers
  # POST /customers.json
  def create
      
    #respond_to do |format|
    #  if @customer.save
    #    UserMailer.welcome_email(@customer).deliver
        #format.html { redirect_to(root_path, notice: 'User was successfully created.') }
    # else
    #    format.html { render :new }
    #    format.json { render json: @customer.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    #@customer.update(customer_params)
    @cus = Customer.where(:cus_email=>session[:customer]).first
    @data = params[:hashData]
    
    @cus.update({:cus_name=>@data["name"],:cus_address=>@data["address"],:cus_phone=>@data["phone"],:cus_password=>@data["passwd"]})  
   
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:cus_name, :cus_address, :cus_phone, :cus_email, :cus_password, :cus_points, :cus_image, :cus_oauth, :cus_status)
    end
    
    #check_customer_login
    def check_customer_login
      if session[:customer].nil?
        redirect_to customers_login_path    
      end
    end
    
end
