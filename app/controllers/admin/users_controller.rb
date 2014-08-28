class Admin::UsersController < ApplicationController
  
  #config for devise
  before_filter :authenticate_user!
  before_filter :u_cancan_access
  
  #config for cancan 
  load_and_authorize_resource  except: [:index]
  
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
    
  # GET /admin/users
  # GET /admin/users.json
  def index
    @admin_users = Admin::User.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
    @admin_users = Admin::User.all
  end

  # GET /admin/users/new
  def new
    @admin_user = Admin::User.new
  end

  # GET /admin/users/1/edit
  def edit
    
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @admin_user = Admin::User.new(admin_user_params)

    if params[:password].blank?
      params.delete(:password)
    end

    respond_to do |format|
      if @admin_user.save
        #format.html { redirect_to @admin_user, notice: 'User was successfully created.' }
        format.html { redirect_to admin_users_path }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to admin_users_path}
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = Admin::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params.require(:admin_user).permit( :email, :password, :role, :address, :phone, :status)
    end
    
    def u_cancan_access
    return if request.get?
    resource = controller_path.singularize.to_sym
    method = "#{:admin_user}_params"
    params[:admin_user] &&= send(method) if respond_to?(method, true)
  end
end
