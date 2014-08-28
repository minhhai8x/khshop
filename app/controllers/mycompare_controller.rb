class MycompareController < ApplicationController
  def index
    @cats = Admin::Catalogue.where("parentid = 0")
    @products = Mycompare.all
    @attr = Admin::Attribute.all
  end
  def add
    @pid = params[:id]
    @attr = Mycompare.new({:product_id=> @pid})
    @attr.save
  end
  def remove
    @attr_id = params[:id]
    @attr = Mycompare.find(@attr_id)
    @attr.destroy
  end
end
