class Admin::ProductsController < ApplicationController
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]
  before_filter :p_cancan_access
  #config for cancan 
  load_and_authorize_resource  except: [:index]
  
  
  # GET /admin/products
  # GET /admin/products.json
  def index
    @admin_products = Admin::Product.all
    #authorize! :index, @admin_products
    #authorize! :read, Admin::Product, :message => "Unable to read this Product."
    #raise CanCan::AccessDenied.new("Not authorized!", :read, Admin::Product)
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
    @admin_products = Admin::Product.all
  end
  
  def p_report
    @cats = Admin::Catalogue.all
    @chartData = []      
    @cats.each do |c|
      @p  = Admin::Product.where(catid: c.id).count
      @chartData << {:name => c.name, :num => @p}  
    end
  end
  
  def p_export
    #@products = Admin::Product.all
    @worksheet = "Thong ke san pham theo the loai"
    @title_table = "Thong ke san pham theo the loai (dang bang)"
    @title_pie = "Thong ke san pham theo the loai (dang tron)"
    @cats = Admin::Catalogue.where("parentid = 0")
    @chartData = []      
    @cats.each do |c|
      @p  = Admin::Product.where(catid: c.id).count
      @chartData << {:name => c.name, :num => @p}  
    end
    @chartData = @chartData.as_json
    response.headers['Content-Disposition'] = 'attachment; filename="products_report.xlsx"'
    
    
  end
  # GET /admin/products/new
  def new
    @admin_product = Admin::Product.new
    #show catalogue
    @cat = Admin::Catalogue.all
    @nsx = Manufacturer.all
  end
  def add_attr
    @data = params[:hashData]
    @arr_id = ""
    @data.each do |k,v|
      @attr = Admin::Attribute.new({:name=>k,:description=>v})
      @attr.save
      @arr_id += ',' + @attr.id.to_s
    end
    @product = Admin::Product.find(params[:id])
    @product.update(:arr_attr=>@arr_id.to_s)
  end
  # GET /admin/products/1/edit
  def edit
    @cat = Admin::Catalogue.all
    @nsx = Manufacturer.all
    if @admin_product.arr_attr
      @attr = @admin_product.arr_attr.split(",").map { |s| s.to_i }
    end
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @admin_product = Admin::Product.new(admin_product_params)

    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_products_url }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.html { render :new }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    respond_to do |format|
      if @admin_product.update(admin_product_params)
        format.html { redirect_to admin_products_url}
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :edit }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product
      @admin_product = Admin::Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_params
      params.require(:admin_product).permit(:name, :price, :description, :catid, :image,:discount,:meta_keyword,:meta_description,:tags,:model,:quantity,:weight,:manufacturer,:special,:reward_point, :status)
    end
    def p_cancan_access
      return if request.get?
      resource = controller_path.singularize.to_sym
      method = "#{:admin_product}_params"
      params[:admin_product] &&= send(method) if respond_to?(method, true)
    end
end
