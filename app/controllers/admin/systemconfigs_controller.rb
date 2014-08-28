class Admin::SystemconfigsController < ApplicationController
  before_action :set_admin_systemconfig, only: [:show, :edit, :update]

  # GET /admin/systemconfigs
  # GET /admin/systemconfigs.json
  def index
    @admin_systemconfigs = Admin::Systemconfig.all
  end

  # GET /admin/systemconfigs/1
  # GET /admin/systemconfigs/1.json
  def show
  end

  # GET /admin/systemconfigs/new
  def new
    @admin_systemconfig = Admin::Systemconfig.new
  end

  # GET /admin/systemconfigs/1/edit
  def edit
  end

  # POST /admin/systemconfigs
  # POST /admin/systemconfigs.json
  def create
    @admin_systemconfig = Admin::Systemconfig.new(admin_systemconfig_params)

    respond_to do |format|
      if @admin_systemconfig.save
        format.html { redirect_to @admin_systemconfig, notice: 'Systemconfig was successfully created.' }
        format.json { render :show, status: :created, location: @admin_systemconfig }
      else
        format.html { render :new }
        format.json { render json: @admin_systemconfig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/systemconfigs/1
  # PATCH/PUT /admin/systemconfigs/1.json
  def update
    respond_to do |format|
      if @admin_systemconfig.update(admin_systemconfig_params)
        format.html { redirect_to edit_admin_systemconfig_path(params[:id]), notice: 'Systemconfig was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_systemconfig }
      else
        format.html { render :edit }
        format.json { render json: @admin_systemconfig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/systemconfigs/1
  # DELETE /admin/systemconfigs/1.json
  def destroy
    @admin_systemconfig.destroy
    respond_to do |format|
      format.html { redirect_to admin_systemconfigs_url, notice: 'Systemconfig was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_systemconfig
      @admin_systemconfig = Admin::Systemconfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_systemconfig_params
      #params.require(:admin_systemconfig).permit( :currency, :rate, :number_bestbuy, :number_bestsell, :number_category, :is_viewer, :is_description, :google_access_id, :google_secret_key,:google_bucket,:google_analytic_id, :paypal_account,:number_new_home,:new_home_rand,:number_spec_cat)
      params.require(:admin_systemconfig).permit!
    end
end
