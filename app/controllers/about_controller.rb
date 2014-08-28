class AboutController < ApplicationController
  def index
    @cats = Admin::Catalogue.where("parentid = 0")
  end
end
