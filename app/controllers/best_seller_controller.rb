class BestSellerController < ApplicationController
  def index
    #show catalogue
    @cats = Admin::Catalogue.all
    #best seller
    
    @bestsellers = Admin::Product.order(created_at: :asc).take(3)
  end
end
