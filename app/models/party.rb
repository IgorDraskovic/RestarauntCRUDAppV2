class Party < ActiveRecord::Base
  has_many :orders
  has_many :foods, through: :orders

  def total
    total = 0
    #I need access to the parties foods
    self.foods.each do |food|
      total += food.cost
    end
    #then add the cost of all of the foods they orderd
    return total
  end

end
