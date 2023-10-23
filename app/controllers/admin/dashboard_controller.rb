class Admin::DashboardController < ApplicationController
  def show
    #Display a count of how many products are in the database
    @product_count = Product.count
    @products = Product.all
    #Display a count of how many categories are in the database
    @product_categories = Category.count
    @categories = Category.all
  end
end
