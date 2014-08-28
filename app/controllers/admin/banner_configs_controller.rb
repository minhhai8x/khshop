class Admin::BannerConfigsController < ApplicationController
  before_action :set_admin_banner_config, only: [:show, :edit, :update, :destroy]

  # GET /admin/banner_configs
  # GET /admin/banner_configs.json
  def index
    @admin_banner_configs = Admin::BannerConfig.all
  end

  # GET /admin/banner_configs/1
  # GET /admin/banner_configs/1.json
  def show
  end

  # GET /admin/banner_configs/new
  def new
    @admin_banner_config = Admin::BannerConfig.new
  end

  # GET /admin/banner_configs/1/edit
  def edit
  end

  # POST /admin/banner_configs
  # POST /admin/banner_configs.json
  def create
    @admin_banner_config = Admin::BannerConfig.new(admin_banner_config_params)

    respond_to do |format|
      if @admin_banner_config.save
        format.html { redirect_to @admin_banner_config, notice: 'Banner config was successfully created.' }
        format.json { render :show, status: :created, location: @admin_banner_config }
      else
        format.html { render :new }
        format.json { render json: @admin_banner_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/banner_configs/1
  # PATCH/PUT /admin/banner_configs/1.json
  def update
    respond_to do |format|
      if @admin_banner_config.update(admin_banner_config_params)
        format.html { redirect_to edit_admin_banner_config_path, notice: 'Banner config was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_banner_config }
      else
        format.html { render :edit }
        format.json { render json: @admin_banner_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/banner_configs/1
  # DELETE /admin/banner_configs/1.json
  def destroy
    @admin_banner_config.destroy
    respond_to do |format|
      format.html { redirect_to admin_banner_configs_url, notice: 'Banner config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_banner_config
      @admin_banner_config = Admin::BannerConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_banner_config_params
      params.require(:admin_banner_config).permit(:bn_speed, :bn_pause, :bn_width, :bn_random, :bn_max_large, :bn_max_small)
    end
end
