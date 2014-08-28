class SearchController < ApplicationController
  def index
    @cats = Admin::Catalogue.where("parentid = 0")
    @keyword = params[:keyword] 
    @search_result = Admin::Product.search(@keyword)
  end
end
