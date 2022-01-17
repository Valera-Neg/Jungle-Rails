class Admin::SalesController < ApplicationController

  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']


def index 
  # @sales = Sale.all
  @sales = Sale.order(id: :desc).all

end

def new
  @sale = Sale.new
end

def destroy 
  @sale = Sale.find params[:id]
  @sale.destroy
  redirect_to [:admin, :sales], notice: 'Sale deleted!'
end

private
def sale_params
  params.require(:sale).permit(
    :name,
    :percent_off,
    :starts_on,
    :ends_on
  )
end

end
