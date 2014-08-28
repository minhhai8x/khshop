class Admin::MymailersController < ApplicationController
  before_action :set_admin_mymailer, only: [:show, :edit, :update, :destroy]
  
  def edit
    
  end
  def update
    respond_to do |format|
      if @admin_mymailer.update(admin_mymailer_params)
        format.html { redirect_to edit_admin_mymailer_path(params[:id])}
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_mymailer
      @admin_mymailer = Admin::Mymailer.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_mymailer_params
      params.require(:admin_mymailer).permit(:e_title, :e_address, :e_port, :e_domain, :e_username, :e_password)
    end
end
