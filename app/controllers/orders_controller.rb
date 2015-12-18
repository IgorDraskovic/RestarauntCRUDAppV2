class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @parties = Party.all
    @foods = Food.all
  end

  def new
    @order = Order.new
  end

  def create
    Order.create( order_params )
    redirect_to orders_path
  end

  private
  def order_params
    params.require(:order).permit(:food_id, :party_id, :is_fulfilled)
  end


end
