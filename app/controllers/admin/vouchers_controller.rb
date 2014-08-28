class Admin::VouchersController < ApplicationController
  before_action :set_admin_voucher, only: [:show, :edit, :update, :destroy]

  # GET /admin/vouchers
  # GET /admin/vouchers.json
  def index
    @admin_vouchers = Admin::Voucher.all
  end

  # GET /admin/vouchers/1
  # GET /admin/vouchers/1.json
  def show
  end

  # GET /admin/vouchers/new
  def new
    @admin_voucher = Admin::Voucher.new
  end

  # GET /admin/vouchers/1/edit
  def edit
  end
  #send email
  def send_email
    @vc_id = params[:vc_id]
    @vc = Admin::Voucher.find(@vc_id.to_i)
    
    
    #Config for Action mailer
    ActionMailer::Base.smtp_settings = {
      address: email_config.e_address,
      port: email_config.e_port,
      domain: email_config.e_domain,
      authentication: "plain",
      enable_starttls_auto: true,
      user_name: email_config.e_username,
      password: email_config.e_password
    } 
    ActionMailer::Base.default_options = { from: @vc.from_email}
    #send email
    UserMailer.voucher_email(@vc).deliver
  end
  # POST /admin/vouchers
  # POST /admin/vouchers.json
  def create
    @admin_voucher = Admin::Voucher.new(admin_voucher_params)

    respond_to do |format|
      if @admin_voucher.save
        format.html { redirect_to admin_vouchers_path, notice: 'Voucher was successfully created.' }
        format.json { render :show, status: :created, location: @admin_voucher }
      else
        format.html { render :new }
        format.json { render json: @admin_voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/vouchers/1
  # PATCH/PUT /admin/vouchers/1.json
  def update
    respond_to do |format|
      if @admin_voucher.update(admin_voucher_params)
        format.html { redirect_to admin_vouchers_path, notice: 'Voucher was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_voucher }
      else
        format.html { render :edit }
        format.json { render json: @admin_voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/vouchers/1
  # DELETE /admin/vouchers/1.json
  def destroy
    @admin_voucher.destroy
    respond_to do |format|
      format.html { redirect_to admin_vouchers_url, notice: 'Voucher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_voucher
      @admin_voucher = Admin::Voucher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_voucher_params
      params.require(:admin_voucher).permit(:v_code, :from_name, :from_email, :to_name, :to_email, :v_messsage, :v_amount, :v_status)
    end
end
