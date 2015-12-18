class Food < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :parties, through: :orders
end
