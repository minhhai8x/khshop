class Admin::CouponsController < ApplicationController
  before_action :set_admin_coupon, only: [:show, :edit, :update, :destroy]

  # GET /admin/coupons
  # GET /admin/coupons.json
  def index
    @admin_coupons = Admin::Coupon.all
  end

  # GET /admin/coupons/1
  # GET /admin/coupons/1.json
  def show
  end

  # GET /admin/coupons/new
  def new
    @admin_coupon = Admin::Coupon.new
  end

  # GET /admin/coupons/1/edit
  def edit
  end

  # POST /admin/coupons
  # POST /admin/coupons.json
  def create
    @admin_coupon = Admin::Coupon.new(admin_coupon_params)

    respond_to do |format|
      if @admin_coupon.save
        format.html { redirect_to admin_coupons_path, notice: 'Coupon was successfully created.' }
        format.json { render :show, status: :created, location: @admin_coupon }
      else
        format.html { render :new }
        format.json { render json: @admin_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/coupons/1
  # PATCH/PUT /admin/coupons/1.json
  def update
    respond_to do |format|
      if @admin_coupon.update(admin_coupon_params)
        format.html { redirect_to admin_coupons_path, notice: 'Coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_coupon }
      else
        format.html { render :edit }
        format.json { render json: @admin_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/coupons/1
  # DELETE /admin/coupons/1.json
  def destroy
    @admin_coupon.destroy
    respond_to do |format|
      format.html { redirect_to admin_coupons_url, notice: 'Coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_coupon
      @admin_coupon = Admin::Coupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_coupon_params
      params.require(:admin_coupon).permit(:name, :code, :discount, :start_date, :end_date, :is_login, :is_free_ship, :apply_products, :apply_catalogues, :max_times, :max_times_cus, :status)
    end
end
