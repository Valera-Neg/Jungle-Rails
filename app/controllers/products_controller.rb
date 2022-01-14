class ProductsController < ApplicationController
 
  def index
    @products = Product.all.order(created_at: :desc)
  end
  puts @products

  def show
    @product = Product.find params[:id]
  end

end
