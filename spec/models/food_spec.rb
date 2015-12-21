require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "given a party" do
    before do
      @party = Party.create({number: '99'})
      @tir = Food.create({name: 'Tiramisu'})
      @ice = Food.create({name: 'Vanilla Icecream'})
      Order.create({party: @party, food: @tir})
      Order.create({party: @party, food: @tir})
      Order.create({party: @party, food: @tir})
      Order.create({party: @party, food: @ice})
    end
    describe '#favorite_food' do
      it 'returns most consumed food' do
        actual = @party.favorite_food
        expectation = @tir
        expect(actual).to eq(expectation)
      end
    end
  end
end
