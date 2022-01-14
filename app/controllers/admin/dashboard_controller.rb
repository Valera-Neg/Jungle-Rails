class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def show
    @total_items_quantaty = Product.all.count
    @number_categories = Category.all.count
  end
end


