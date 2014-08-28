class Admin::OrdersController < ApplicationController
  #config for cancan 
  load_and_authorize_resource  except: [:index]
  
  before_action :set_admin_order, only: [:show, :edit, :update, :destroy]
  
  # GET /admin/orders
  # GET /admin/orders.json
  def index
    @admin_orders = Order.all
  end
  
  def edit
    
  end
  
  def report
    @days = day_of_month
    @order_report = []
    day_of_month.to_i.times do |d|
      @order_report << [d+1,Order.where("created_at >= ?",begin_of_date(d+1)).where("created_at <= ?",end_of_date(d+1)).count]
    end
  end
  def o_export
    @worksheet = "Thong ke don hang trong thang"
    
    @days = day_of_month
    @order_report = []
    day_of_month.to_i.times do |d|
      @order_report << {:mdate=>d+1,:num=> Order.where("created_at >= ?",begin_of_date(d+1)).where("created_at <= ?",end_of_date(d+1)).count}
    end
    response.headers['Content-Disposition'] = 'attachment; filename="order_report.xlsx"'
  end
  
  def show
    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_order
      @admin_order = Order.find(params[:id])
    end  
    
end
