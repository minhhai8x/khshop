class Admin::CataloguesController < ApplicationController
  before_action :set_admin_catalogue, only: [:show, :edit, :update, :destroy]
  
  before_filter :c_cancan_access
  #config for cancan 
  load_and_authorize_resource  except: [:index]
  
  # GET /admin/catalogues
  # GET /admin/catalogues.json
  def index
    @admin_catalogues = Admin::Catalogue.all
  end

  # GET /admin/catalogues/1
  # GET /admin/catalogues/1.json
  def show
    #Phan quyen khong cho doc
    
   #@cat = Catalogues.find(params[:id])
   # require the ability to read documents
   #authorize! :read, @cat
   @admin_catalogues = Admin::Catalogue.all
  end
  
  # GET /admin/catalogues/new
  def new
    @admin_catalogue = Admin::Catalogue.new
    @cat = Admin::Catalogue.all
  end

  # GET /admin/catalogues/1/edit
  def edit
    @cat = Admin::Catalogue.all
  end

  # POST /admin/catalogues
  # POST /admin/catalogues.json
  def create
    @admin_catalogue = Admin::Catalogue.new(admin_catalogue_params)

    respond_to do |format|
      if @admin_catalogue.save
        format.html { redirect_to admin_catalogues_url, notice: 'Catalogue was successfully created.' }
        format.json { render :show, status: :created, location: @admin_catalogue }
      else
        format.html { render :new }
        format.json { render json: @admin_catalogue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/catalogues/1
  # PATCH/PUT /admin/catalogues/1.json
  def update
    respond_to do |format|
      if @admin_catalogue.update(admin_catalogue_params)
        format.html { redirect_to admin_catalogues_url, notice: 'Catalogue was successfully updated.'  }
        format.json { render :show, status: :ok, location: @admin_catalogue }
      else
        format.html { render :edit }
        format.json { render json: @admin_catalogue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/catalogues/1
  # DELETE /admin/catalogues/1.json
  def destroy
    @admin_catalogue.destroy
    respond_to do |format|
      format.html { redirect_to admin_catalogues_url, notice: 'Catalogue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_catalogue
      @admin_catalogue = Admin::Catalogue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_catalogue_params
      params.require(:admin_catalogue).permit(:name, :parentid, :description, :meta_keyword, :meta_description, :sort_order,:status)
    end
    
    def c_cancan_access
      return if request.get?
      resource = controller_path.singularize.to_sym
      method = "#{:admin_catalogue}_params"
      params[:admin_catalogue] &&= send(method) if respond_to?(method, true)
    end
end
