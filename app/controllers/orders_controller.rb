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

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update( order_params )
    redirect_to orders_path #this can be taco
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to orders_path
  end


  private
  def order_params
    params.require(:order).permit(:food_id, :party_id, :number, :is_fulfilled)
  end


end
