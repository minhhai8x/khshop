class Admin::AttributesController < ApplicationController
  before_action :set_admin_attribute, only: [:show, :edit, :update, :destroy]

  # GET /admin/attributes
  # GET /admin/attributes.json
  def index
    @admin_attributes = Admin::Attribute.all
  end

  # GET /admin/attributes/1
  # GET /admin/attributes/1.json
  def show
  end

  # GET /admin/attributes/new
  def new
    @admin_attribute = Admin::Attribute.new
  end

  # GET /admin/attributes/1/edit
  def edit
  end

  # POST /admin/attributes
  # POST /admin/attributes.json
  def create
    @admin_attribute = Admin::Attribute.new(admin_attribute_params)

    respond_to do |format|
      if @admin_attribute.save
        format.html { redirect_to admin_attributes_path, notice: 'Attribute was successfully created.' }
        format.json { render :show, status: :created, location: @admin_attribute }
      else
        format.html { render :new }
        format.json { render json: @admin_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/attributes/1
  # PATCH/PUT /admin/attributes/1.json
  def update
    respond_to do |format|
      if @admin_attribute.update(admin_attribute_params)
        format.html { redirect_to admin_attributes_path, notice: 'Attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_attribute }
      else
        format.html { render :edit }
        format.json { render json: @admin_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/attributes/1
  # DELETE /admin/attributes/1.json
  def destroy
    @admin_attribute.destroy
    respond_to do |format|
      format.html { redirect_to admin_attributes_url, notice: 'Attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_attribute
      @admin_attribute = Admin::Attribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_attribute_params
      params.require(:admin_attribute).permit(:name, :description, :orderby, :product_id)
    end
end
