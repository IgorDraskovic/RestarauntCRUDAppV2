class FoodsController < ApplicationController

 before_action :authenticate!

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    food = Food.create( food_params )
    redirect_to foods_path
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    food = Food.find(params[:id])
    food.update( food_params )
    redirect_to food_path(food) #this can be taco
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:cuisine, :name, :cost)
  end

end
