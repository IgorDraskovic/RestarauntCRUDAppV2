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

  def favorite_food
      foods = self.foods
      food_counts = foods.uniq.map do |food|
        {
          food: food,
          count: foods.to_a.count(food)
        }
      end
      largest_count = food_counts.max_by {|c| c[:count]}
      largest_count[:food]
    end
end
