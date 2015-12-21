class PartiesController < ApplicationController

  def index
    @parties = Party.all
  end

  def new
    @party = Party.new
  end

  def create
    party = Party.create( food_params )
    redirect_to parties_path
  end

  def show
    @party = Party.find(params[:id])
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    party = Party.find(params[:id])
    party.update( food_params )
    redirect_to party_path(party) #this can be taco
  end

  def destroy
    party = Party.find(params[:id])
    party.destroy
    redirect_to parties_path
  end

  private

  def food_params
    params.require(:party).permit(:number)
  end

end
