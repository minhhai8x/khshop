class Admin::MyreportsController < ApplicationController
  def index
    #report for order of month
    @days = day_of_month
    @order_report = []
    day_of_month.to_i.times do |d|
      @order_report << [d+1,Order.where("created_at >= ?",begin_of_date(d+1)).where("created_at <= ?",end_of_date(d+1)).count]
    end
    #report for products of catalogue
    @cats = Admin::Catalogue.all
    @chartData = []      
    @cats.each do |c|
      @p  = Admin::Product.where(catid: c.id).count
      @chartData << {:name => c.name, :num => @p}  
    end
  end
  def list_customers
    @list_customers = Customer.all
  end
  def cus_view_buy
    @chartData = []      
      @v  = Admin::Product.where("is_view > 0").count
      @b  = Admin::Product.where("is_buy > 0").count
  end
  def cus_export
    @worksheet = "Thong ke nguoi xem va nguoi mua"
    @bv = "Nguoi xem"
    @bb = "Nguoi mua"
    @chartData = []      
    @v  = Admin::Product.where("is_view > 0").count
    @b  = Admin::Product.where("is_buy > 0").count
    response.headers['Content-Disposition'] = 'attachment; filename="customers_report.xlsx"'
  end
end
